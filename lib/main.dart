import 'package:flutter/material.dart';
import 'widgetDemo/TextWidget.dart';
import 'widgetDemo/ContainerWidget.dart';
import 'widgetDemo/ImageWidget.dart';
import 'widgetDemo/TextFieldWidget.dart';
import 'widgetDemo/RaisedButtonWidget.dart';
import 'widgetDemo/SwitchWidget.dart';
import 'widgetDemo/SliderWidget.dart';
import 'widgetDemo/RowWidget.dart';
import 'widgetDemo/ExpandedWidget.dart';
import 'widgetDemo/ScaffoldWidget.dart';
import 'widgetDemo/SingleChildScorllViewWidget.dart';
import 'widgetDemo/CustomScrollViewWidget.dart';
import 'widgetDemo/ListViewWidget.dart';
import 'widgetDemo/GridViewWidget.dart';
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
    return MaterialApp(home: new InitializePage(),
//      home: new TextWidget(),
//      home: new ContainerWidget(),
//      home: new TextFieldWidget(),
//      home: new RaisedButtonWidget(),
//      home: new SwitchWidget(),
//      home: new SliderWidget(),
//      home: new RowWidget(),
//      home: new ExpandedWidget(),
//      home: new ScaffoldWidget(),
//      home: new SingleChildScrollViewWidget(),
//      home: new CustomScrollViewWidget(),
//      home: new ListViewWidget(),
//      home: new GridViewWidget(),
        routes: {
          RouteUtils.MAINPAGE: (btx) => new MainPage(),
          RouteUtils.WebViewPage: (btx) => new WebViewPage(),
          RouteUtils.SystemDetailPage: (btx) => new SystemDetailPage(),
          RouteUtils.GoBangPage: (btx) => new GobangPage(),
          RouteUtils.LOGINPAGE: (btx) => new LoginPage(),
        });
  }
}
