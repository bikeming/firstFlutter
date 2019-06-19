import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RaisedButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("RaisedButtonWidget"),
      ),
      body: Center(
        child: new RaisedButton(
          onPressed: _pressed,
          child: Text("按钮"),
          textColor: Colors.white,
          disabledTextColor: Colors.white70,
          color: Colors.tealAccent,
          disabledColor: Colors.deepOrange,
          elevation: 8,
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          shape: Border.all(
            color: Colors.red,
            width: 1,
          ),
        ),
      ),
    );
  }

  void _pressed() {
    Fluttertoast.showToast(
        msg: "按钮点击",
        toastLength: Toast.LENGTH_SHORT,
        fontSize: 14,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.lightBlue);
  }
}
