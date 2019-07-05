import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/gestures.dart';
import 'package:firstflutter/http/DioUtils.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firstflutter/bean/LoginResponse.dart';
import 'package:firstflutter/utils/RouteUtils.dart';

/// @author: fjm
/// @date: 2019/6/26 15:00
/// @Version:1.0
/// @Description: 登录页

class LoginPage extends StatelessWidget {
  final _loginBg = "lib/images/bg_login.png";
  final _avator = "lib/images/myAvator.jpg";

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

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
                  width: 100,
                ),
              ),
            ),
            flex: 1,
          ),

          ///主题页面
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
  final TextEditingController _userNameController =
      new TextEditingController(text: "fengzi");
  final TextEditingController _pwdController =
      new TextEditingController(text: "123456");
  final TapGestureRecognizer _recognizer = new TapGestureRecognizer();
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
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
      margin: EdgeInsets.only(left: 20, right: 20),
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
//    Fluttertoast.showToast(
//        msg: "name:${_userNameController.text}--pwd:${_pwdController.text}");
    Map<String, dynamic> map = new Map();
    map["username"] = _userNameController.text.trim();
    map["password"] = _pwdController.text.trim();

    DioUtil.getInstance().post(
      "/user/login",
      (data) {
        LoginResponse response = LoginResponse.fromJsonMap(data);
        Fluttertoast.showToast(msg: response.username);
        RouteUtils.pushNamed(_context, RouteUtils.MAINPAGE,
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
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Icon(
                Icons.account_circle,
                color: Colors.lightBlue,
                size: 30,
              ),
              margin: EdgeInsets.only(right: 10),
            ),
            Expanded(
                child: TextField(
                    autofocus: true,
                    controller: _userNameController,
//                    textInputAction: TextInputAction.newline,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "用户名",
                        contentPadding: EdgeInsets.all(10),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.lightBlue, width: 0.8),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ))))
          ],
        ));
  }

  Widget pwd() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Icon(
              Icons.lock_outline,
              color: Colors.lightBlue,
              size: 30,
            ),
            margin: EdgeInsets.only(right: 10),
          ),
          Expanded(
              child: TextField(
                  controller: _pwdController,
//                textInputAction: TextInputAction.go,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      hintText: "密码",
                      hintStyle: TextStyle(color: Colors.white70),
                      contentPadding: EdgeInsets.all(10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.lightBlue, width: 0.8),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ))))
        ],
      ),
    );
  }
}
