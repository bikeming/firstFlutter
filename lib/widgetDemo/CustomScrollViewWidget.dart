import 'package:flutter/material.dart';

class CustomScrollViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
              "SliversDemo",
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
//              title: Text("demo"),
              background: Image.asset("lib/images/avator.png"),
            ),
            pinned: true,
          ),
          SliverFixedExtentList(
              delegate:
                  new SliverChildBuilderDelegate(_builder, childCount: 20),
              itemExtent: 50)
        ],
      ),
    );
  }

  Widget _builder(BuildContext context, int index) {
    return new Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(10),
        color: Colors.lightBlue[100 * (index % 9)],
        child: new Text("listitem-$index"));
  }
}
