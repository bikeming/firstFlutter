import 'package:flutter/material.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/widgets/LoadingWidget.dart';
import 'ProgectTabBarView.dart';

/// @author: jm
/// @date: 2019/7/1 13:45
/// @Version:1.0
/// @Description: 项目页面

class Page4 extends StatefulWidget {
  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> with TickerProviderStateMixin {
  TabController _tabController;
  List _tabList = new List();

  @override
  void initState() {
    super.initState();
    _getProgectDatas();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _tabController = new TabController(length: _tabList.length, vsync: this);
    if (_tabList.isEmpty) {
      return LoadingWidget();
    }
    return Column(
      children: <Widget>[
        TabBar(
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.lightBlue,
          isScrollable: true,
          controller: _tabController,
          tabs: _tabList.map((tabListItem) {
            return Tab(text: tabListItem['name']);
          }).toList(),
        ),
        Expanded(
            child: TabBarView(
          controller: _tabController,
          children: _tabList.map((item) {
            return ProjectTabBarView(item['id'].toString());
          }).toList(),
        ))
      ],
    );
  }

  void _getProgectDatas() {
    DioUtil.getInstance().get("/project/tree/json", (response) {
      if (mounted) {
        setState(() {
          _tabList = response;
        });
      }
    });
  }
}
