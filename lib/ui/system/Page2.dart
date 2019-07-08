import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

/// @author: jm
/// @date: 2019/7/1 13:45
/// @Version:1.0
/// @Description: 体系页面

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    List<Color> colorList = [
      Colors.orange,
      Colors.blueGrey,
      Colors.green,
      Colors.deepPurple,
      Colors.indigo
    ];
    return RefreshIndicator(
        child: new FutureBuilder(
          future: _getSystemData(),
          builder: (BuildContext context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {
              List list = snapShot.data;
              return Container(
                padding: EdgeInsets.only(left: 10),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 5,
                  children: list.map((listItem) {
                    return ActionChip(
                        label: Text(
                          listItem["name"],
                          style: TextStyle(
                              color: colorList[
                                  Random().nextInt(colorList.length)]),
                        ),
                        avatar: CircleAvatar(
                          child: Text(
                            listItem["name"].toString().substring(0, 1),
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.lightBlue,
                        ),
                        onPressed: () {
                          Fluttertoast.showToast(msg: listItem["name"]);
                        });
                  }).toList(),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      strokeWidth: 1.0,
                    ),
                    Text("加载中...")
                  ],
                ),
              );
            }
          },
        ),
        onRefresh: _reFreshed);
  }

  Future<void> _reFreshed() async {
    setState(() {});
  }

  Future _getSystemData() {
    return DioUtil.getInstance().requst(Method.GET, "/tree/json");
  }
}
