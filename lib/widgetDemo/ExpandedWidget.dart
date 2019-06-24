import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ExpandeWidget"),
      ),
      body: new Row(
        children: <Widget>[
          RaisedButton(
            onPressed: () {},
            child: Text("bt1"),
            color: Colors.tealAccent,
          ),
          Expanded(
              flex: 1,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.lightBlue,
                child: Text("bt2"),
              )),
          Expanded(
              flex: 2,
              child: RaisedButton(
                onPressed: () {},
                color: Colors.red,
                child: Text("bt3"),
              ))
        ],
      ),
    );
  }
}
