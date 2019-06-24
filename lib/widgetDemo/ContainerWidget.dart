import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("ContainerWidget"),
      ),
      body: Container(
        child: Text(
          "ContainerWidget",
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 20, color: Colors.lightBlue),
        ),
        padding: EdgeInsets.fromLTRB(60, 20, 60, 20),
        margin: EdgeInsets.all(20),
//        width: 250,
        height: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.lightBlue, width: 2),
            boxShadow: [
              new BoxShadow(
                  color: Colors.deepPurpleAccent,
                  blurRadius: 8,
                  offset: Offset(5, 5))
            ]),
      ),
    );
  }
}
