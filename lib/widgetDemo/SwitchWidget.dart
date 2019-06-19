import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SwitchState();
  }
}

class SwitchState extends State<SwitchWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("SwitchWidget"),
        ),
        body: Center(
          child: new Switch(
              value: isChecked,
              activeColor: Colors.lightBlue,
              activeTrackColor: Colors.amber,
              inactiveTrackColor: Colors.red,
              onChanged: (bool b) {
                setState(() {
                  this.isChecked = !isChecked;
                });
              }),
        ));
  }
}
