import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "a---------a",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a************b",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a-------s",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "a",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
