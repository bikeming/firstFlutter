import 'package:flutter/material.dart';
import 'ui/LoginPage.dart';
import 'package:firstflutter/utils/RouteUtils.dart';
import 'package:firstflutter/ui/MainPage.dart';
import 'package:firstflutter/ui/WebViewPage.dart';
import 'package:firstflutter/ui/system/SystemDetailPage.dart';
import 'package:firstflutter/ui/usercenter/GoBangPage.dart';
import 'ui/InitializePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new InitializePage(),
      routes: {
        RouteUtils.MAINPAGE: (btx) => new MainPage(),
        RouteUtils.WebViewPage: (btx) => new WebViewPage(),
        RouteUtils.SystemDetailPage: (btx) => new SystemDetailPage(),
        RouteUtils.GoBangPage: (btx) => new GobangPage(),
        RouteUtils.LOGINPAGE: (btx) => new LoginPage(),
      },
    );
  }
}
