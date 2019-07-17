import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/bean/LoginResponse.dart';
import 'package:firstflutter/utils/RouteUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstflutter/Constants.dart';

/// @author: fjm
/// @date: 2019/6/26 15:00
/// @Version:1.0
/// @Description: 登录页

class LoginPage extends StatelessWidget {
  final _loginBg = "lib/images/bg_login.png";
  final _avator = "lib/images/myAvator.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            Stack(alignment: AlignmentDirectional.topCenter, children: <Widget>[
      ///登录背景
      Image.asset(
        _loginBg,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Column(
        children: <Widget>[
          ///圆角头像
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: ClipOval(
                child: Image.asset(
                  _avator,
                  width: ScreenUtil().setWidth(180),
                ),
              ),
            ),
            flex: 1,
          ),

          ///主体页面
          Expanded(
            child: new LoginBody(),
            flex: 2,
          )
        ],
      )
    ]));
  }
}

class LoginBody extends StatelessWidget {
  final TextEditingController _userNameController = new TextEditingController();
  final TextEditingController _pwdController = new TextEditingController();
  final TapGestureRecognizer _recognizer = new TapGestureRecognizer();
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    _initUserInfo();
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ///用户名Widget
          userName(),

          ///密码Widget
          pwd(),

          ///登录按钮Widget
          loginButton(),

          ///去注册(富文本)
          registRichText()
        ],
      ),
      margin: EdgeInsets.only(left: 40, right: 40),
    );
  }

  _loginBtPress() {
    if (_userNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入用户名");
      return;
    }
    if (_pwdController.text.isEmpty) {
      Fluttertoast.showToast(msg: "请输入密码");
      return;
    }
    Map<String, dynamic> map = new Map();
    map["username"] = _userNameController.text.trim();
    map["password"] = _pwdController.text.trim();

    DioUtil.getInstance().post(
      "/user/login",
      (data) async {
        LoginResponse response = LoginResponse.fromJsonMap(data);
        await SharedPreferences.getInstance()
          ..setString(Constants.spKey_username, map["username"])
          ..setString(Constants.spKey_pwd, map["password"]);
        RouteUtils.pushReplacementNamed(_context, RouteUtils.MAINPAGE,
            arguments: response.username);
      },
      params: map,
    );
  }

  Widget registRichText() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: RichText(
        text: TextSpan(children: [
          TextSpan(text: "尚无账号?"),
          TextSpan(
              text: "去注册~",
              style: TextStyle(color: Colors.lightBlue),
              recognizer: _recognizer
                ..onTap = () {
                  Fluttertoast.showToast(msg: "暂未开放");
                })
        ]),
      ),
    );
  }

  Widget loginButton() {
    return Container(
      margin: EdgeInsets.only(top: 50),
      width: ScreenUtil().setWidth(450),
//      width: ScreenUtil.screenWidth / 3,
      child: RaisedButton(
        onPressed: _loginBtPress,
        child: Text(
          "登录",
          style: TextStyle(fontSize: 16),
        ),
        textColor: Colors.white,
        color: Colors.lightBlue,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      ),
    );
  }

  Widget userName() {
    return Theme(
        data: ThemeData(
          primaryColor: Colors.lightBlue,
          hintColor: Colors.white70,
        ),
        child: TextField(
//            autofocus: true,
            controller: _userNameController,
//                    textInputAction: TextInputAction.newline,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.account_circle,
                    color: Colors.lightBlue, size: 20),
                hintText: "用户名",
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue, width: 0.8),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ))));
  }

  Widget pwd() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: TextField(
          obscureText: true,
          controller: _pwdController,
//                textInputAction: TextInputAction.go,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.lightBlue,
                size: 20,
              ),
              hintText: "密码",
              hintStyle: TextStyle(color: Colors.white70),
              contentPadding: EdgeInsets.all(10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 0.8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue, width: 0.8),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ))),
    );
  }

  void _initUserInfo() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    _userNameController.text = sp.getString(Constants.spKey_username);
    _pwdController.text = sp.getString(Constants.spKey_pwd);
  }
}
