import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstflutter/Constants.dart';
import 'package:firstflutter/utils/RouteUtils.dart';

/// @author: jm
/// @date: 2019/7/15 15:06
/// @Version:1.0
/// @Description: 抽屉栏=》个人中心

// ignore: must_be_immutable
class UserCenterDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        padding: EdgeInsets.all(10),
        child: ListView(children: <Widget>[
          userInfo(context),
          ListTile(
            title: Text("五子棋"),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              RouteUtils.pushNamed(context, RouteUtils.GoBangPage);
            },
          ),
          ListTile(
            title: Text("五子棋"),
            trailing: Icon(Icons.arrow_forward),
          )
        ]),
      ),
    );
  }

  Widget userInfo(BuildContext context) {
    final _avator = "lib/images/myAvator.jpg";

    return Container(
        margin: EdgeInsets.only(top: 20),
        child: Row(
          children: <Widget>[
            InkWell(
              child: ClipOval(
                  child: Image.asset(
                _avator,
                width: ScreenUtil().setWidth(120),
              )),
              onTap: () => RouteUtils.pushNamedAndRemoveUntil(
                  context, RouteUtils.LOGINPAGE, (route) => false),
            ),
            Padding(padding: EdgeInsets.all(10)),
            Expanded(
              child: FutureBuilder(
                  future: _future(),
                  builder: (context, snapShot) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapShot.data['userName'],
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text(
                          snapShot.data['pwd'],
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    );
                  }),
            )
          ],
        ));
  }

  Future<Map> _future() async {
    Map map = new Map();
    SharedPreferences sp = await SharedPreferences.getInstance();
    map = {
      'userName': sp.getString(Constants.spKey_username),
      'pwd': sp.getString(Constants.spKey_pwd)
    };
    return map;
  }
}
