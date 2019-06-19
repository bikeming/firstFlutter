import 'package:flutter/material.dart';
import 'package:firstflutter/Constants.dart';
import 'dart:developer';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<LoginPage> {
  TextEditingController userNameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldState = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldState,
      appBar: new AppBar(
        title: Text("登 录1"),
        centerTitle: true,
      ),
      body: new Container(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "lib/images/avator.png",
              width: 100,
              height: 100,
            ),
            userNameTextField(),
            pwdTextField(),
            new Padding(
                padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: new RaisedButton(
                  child: Text(
                    "登录",
                    style: new TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  color: Colors.lightBlue,
                  onPressed: () {
                    _doLogin();
                  },
                ))
          ],
        ),
      ),
    );
  }

  TextField userNameTextField() {
    TextField field = new TextField(
      controller: userNameController,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "请输入用户名",
          labelText: Constants.userNameText,
          prefixIcon: Icon(Icons.person)),
    );
    return field;
  }

  TextField pwdTextField() {
    TextField field = new TextField(
      controller: pwdController,
      autofocus: true,
      decoration: InputDecoration(
          hintText: "请输入密码",
          labelText: Constants.pwdText,
          prefixIcon: Icon(Icons.lock)),
    );
    return field;
  }

  void _doLogin() {
    if (userNameController.text.isEmpty) {
      scaffoldState.currentState
          .showSnackBar(new SnackBar(content: Text("请输入用户名")));
      return;
    }
    if (pwdController.text.isEmpty) {
      scaffoldState.currentState
          .showSnackBar(new SnackBar(content: Text("请输入密码")));
      return;
    }
  }
}
