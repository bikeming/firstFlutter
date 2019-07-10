
import 'package:flutter/material.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/widgets/LoadingWidget.dart';
import 'dart:math';

/// @author: jm
/// @date: 2019/7/1 13:45
/// @Version:1.0
/// @Description: 导航页

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List _dataList = new List();
  int _onTapIndex = 0;
  List<Color> _colorList = [
    Colors.orange,
    Colors.blueGrey,
    Colors.green,
    Colors.deepPurple,
    Colors.indigo
  ];

  @override
  void initState() {
    super.initState();
    _getDatas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _getBody(),
    );
  }

  Widget _getBody() {
    if (_dataList.isEmpty) {
      return LoadingWidget();
    }
    ListView listView = ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return _itemBuilder(context, index);
      },
      itemCount: _dataList.length,
    );
    return Row(
      children: <Widget>[
        Expanded(
          child: listView,
          flex: 1,
        ),
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,
            children:
                (_dataList[_onTapIndex]['articles'] as List).map((itemData) {
              return ActionChip(
                avatar: CircleAvatar(
                  child: Text(itemData['title'].toString().substring(0, 1)),
                ),
                label: Text(
                  itemData["title"],
                  style: TextStyle(
                      color: _colorList[Random().nextInt(_colorList.length)]),
                ),
                onPressed: () {},
              );
            }).toList(),
          ),
          flex: 3,
        )
      ],
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _onTapIndex = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color:
                _onTapIndex == index ? Color(0xffffffff) : Color(0xffe6e6e6)),
        padding: EdgeInsets.all(10),
        child: Center(
            child: Text(
          _dataList[index]['name'],
          style: TextStyle(
              color: index == _onTapIndex ? Colors.lightBlue : Colors.black87),
        )),
      ),
    );
  }

  _getDatas() {
    DioUtil.getInstance().get("/navi/json", (response) {
      setState(() {
        _dataList = (response as List).cast();
      });
    });
  }
}
