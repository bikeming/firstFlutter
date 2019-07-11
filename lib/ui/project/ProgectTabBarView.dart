import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/widgets/LoadEndWidget.dart';
import 'package:firstflutter/widgets/LoadingWidget.dart';
import 'ProjectTabBarViewItem.dart';

/// @author: jm
/// @date: 2019/7/11 11:18
/// @Version:1.0
/// @Description:

class ProjectTabBarView extends StatefulWidget {
  String _id;

  @override
  _ProjectTabBarViewState createState() => _ProjectTabBarViewState();

  ProjectTabBarView(this._id);
}

class _ProjectTabBarViewState extends State<ProjectTabBarView> {
  int currentPage = 0;
  int totalCount = 0;
  ScrollController scrollController;
  List lastBlocList = new List();

  @override
  void initState() {
    super.initState();
    _getData();
    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      double maxScroll = position.maxScrollExtent;
      double pixels = position.pixels;
      if (pixels == maxScroll && lastBlocList.length < totalCount) {
        Future.delayed(Duration(seconds: 1), () {
          currentPage++;
          _getData();
        });
      }
    });
  }

  Future<void> _refreshed() async {
    await Future.delayed(Duration(seconds: 1), () {
      currentPage = 0;
      _getData();
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (lastBlocList.isEmpty) {
      return LoadingWidget();
    }

    return RefreshIndicator(
      child: ListView.builder(
        controller: scrollController,
        itemBuilder: (context, index) {
          if (index == lastBlocList.length) {
            if (lastBlocList.length < totalCount) {
              return LoadEndWidget("加载中...");
            } else {
              return LoadEndWidget("已经到头了");
            }
          } else {
            return ProjectTabBarViewItem(lastBlocList[index]);
          }
        },
        itemCount: lastBlocList.length + 1,
      ),
      onRefresh: _refreshed,
    );
  }

  _getData() {
    String url = '/project/list/$currentPage/json?cid=${widget._id}';
    DioUtil.getInstance().get(url, (data) {
      List mlist = data['datas'];
      totalCount = data['total'];

      if (mounted)
        setState(() {
          if (currentPage == 0) {
            lastBlocList.clear();
          }
          lastBlocList.addAll(mlist);
        });
    });
  }
}
