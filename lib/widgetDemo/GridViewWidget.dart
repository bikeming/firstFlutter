


import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  final List<IconData> _iconsList = [
    Icons.add,
    Icons.build,
    Icons.map,
    Icons.add,
    Icons.build,
    Icons.map,
    Icons.add,
    Icons.build,
    Icons.build,
    Icons.map
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text("GrideWidget"),
        ),
        body: new GridView.builder(
            itemCount: _iconsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, childAspectRatio: 1),
            itemBuilder: _itemBuilder));
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return Icon(_iconsList[index]);
  }
}
