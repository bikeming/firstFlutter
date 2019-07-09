import 'package:flutter/material.dart';

/// @author: jm
/// @date: 2019/7/9 16:44
/// @Version:1.0
/// @Description: 加载更多widget

class LoadEndWidget extends StatelessWidget {
  final String title;

  LoadEndWidget(this.title);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            )
          ],
        ),
      ),
    );
  }
}
