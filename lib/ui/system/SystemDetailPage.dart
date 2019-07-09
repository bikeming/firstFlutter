import 'package:flutter/material.dart';
import 'DetailBodyPage.dart';

/// @author: jm
/// @date: 2019/7/8 16:39
/// @Version:1.0
/// @Description: 体系模块 二级页面

class SystemDetailPage extends StatefulWidget {
  @override
  _SystemDetailPageState createState() => _SystemDetailPageState();
}

class _SystemDetailPageState extends State<SystemDetailPage>
    with TickerProviderStateMixin {
  Map<String, dynamic> arguments;
  List _tabViewlist;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context).settings.arguments;
    _tabViewlist = arguments['children'];
    _tabController =
        new TabController(length: _tabViewlist.length, vsync: this);

    List tabModelList = arguments["children"];
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments["name"]),
        bottom: TabBar(
            isScrollable: true,
            controller: _tabController,
            tabs: tabModelList.map<Widget>((tabModelListItem) {
              return Tab(
                text: tabModelListItem['name'],
              );
            }).toList()),
      ),
      body: TabBarView(
        children: _tabViewlist.map((tabListItem) {
          return new DetailBodyPage(tabListItem['id'].toString());
        }).toList(),
        controller: _tabController,
      ),
    );
  }
}
