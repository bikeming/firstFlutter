import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firstflutter/Constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'MainPage.dart';
import 'LoginPage.dart';

/// @author: jm
/// @date: 2019/7/17 13:27
/// @Version:1.0
/// @Description:用作初始化的page、判断是否登陆过等

class InitializePage extends StatefulWidget {
  @override
  _InitializePageState createState() => _InitializePageState();
}

class _InitializePageState extends State<InitializePage> {
  bool _isLogined = false;

  @override
  void initState() {
    super.initState();
    _checkIsLogined();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    return _isLogined ? MainPage() : LoginPage();
  }

  void _checkIsLogined() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    if (sp.getString(Constants.spKey_username) == null ||
        sp.getString(Constants.spKey_pwd) == null) {
      _isLogined = false;
    } else {
      _isLogined = true;
    }
    setState(() {});
  }
}
