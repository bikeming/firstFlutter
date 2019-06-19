import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'LoginPage.dart';
import 'widgetDemo/TextWidget.dart';
import 'widgetDemo/ContainerWidget.dart';
import 'widgetDemo/ImageWidget.dart';
import 'widgetDemo/TextFieldWidget.dart';
import 'widgetDemo/RaisedButtonWidget.dart';
import 'widgetDemo/SwitchWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: new LoginPage(),
//      home: new TextWidget(),
//      home: new ContainerWidget(),
//      home: new TextFieldWidget(),
//      home: new RaisedButtonWidget(),
      home: new SwitchWidget(),
    );
  }
}
