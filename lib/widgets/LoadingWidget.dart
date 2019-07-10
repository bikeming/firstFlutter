import 'package:flutter/material.dart';

/// @author: jm
/// @date: 2019/7/9 17:02
/// @Version:1.0
/// @Description:

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(
            strokeWidth: 0.8,
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
          Text(
            "加载中...",
            style: TextStyle(color: Colors.lightBlue),
          )
        ],
      ),
    );
  }

  LoadingWidget({String loadText = "加载中..."});
}
