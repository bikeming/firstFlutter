import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textWidget"),
      ),
      body: Center(
        child: Text(
          "textWidget,textWidget,textWidget,textWidget,textWidget,textWidget,",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: Colors.lightBlue,
              fontSize: 25,
              decoration: TextDecoration.lineThrough),
        ),
      ),
    );
  }
}
