import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text("ListViewWidget"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text("ListViewHeard"),
          ),
          Expanded(
              flex: 1,
              child: new ListView.separated(
                  itemBuilder: _itemBuilder,
                  separatorBuilder: _separatorBuilder,
                  itemCount: 20))
        ],
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < 19) {
      return new Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          title: Text("index-$index"),
        ),
      );
    } else {
      return new Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(6),
        child: ListTile(
          title: Text(
            "已经到底了-$index",
            style: TextStyle(color: Colors.red),
          ),
        ),
      );
    }
  }

  Widget _separatorBuilder(BuildContext context, int index) {
    return Divider(
      color: Colors.lightBlue,
    );
  }
}
