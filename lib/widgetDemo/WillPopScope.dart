import 'package:flutter/material.dart';

class WillPopScopeWidget extends StatelessWidget {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return new Scaffold(
      appBar: AppBar(
        title: Text("WillPopScope"),
      ),
      body: new WillPopScope(child: null, onWillPop: null),
    );
  }

  bool _onWillPop() {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      //两次点击间隔超过1秒则重新计时
      _lastPressedAt = DateTime.now();
      return false;
    }
    return true;
  }
}
