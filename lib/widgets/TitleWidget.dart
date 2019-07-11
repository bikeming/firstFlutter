import 'package:flutter/material.dart';

/// @author: jm
/// @date: 2019/7/11 14:06
/// @Version:1.0
/// @Description:

class TitleWidget extends StatelessWidget {
  Widget titleLeft;
  Text titleText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          titleLeft == null
              ? Divider(
                  height: 0,
                )
              : titleLeft,
         Expanded(child: titleText)
        ],
      ),
    );
  }

  TitleWidget(this.titleText, {this.titleLeft});
}
