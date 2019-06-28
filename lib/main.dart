import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
      home: new LoginPage(),
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
    );
  }
}
