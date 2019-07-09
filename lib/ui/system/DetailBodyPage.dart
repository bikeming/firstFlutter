import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'DetailItem.dart';
import 'package:firstflutter/widgets/LoadEndWidget.dart';

/// @author: jm
/// @date: 2019/7/8 17:18
/// @Version:1.0
/// @Description:

class DetailBodyPage extends StatefulWidget {
  String _id;

  @override
  _DetailBodyPageState createState() => _DetailBodyPageState();

  DetailBodyPage(this._id);
}

class _DetailBodyPageState extends State<DetailBodyPage> {
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
            return DetailItem(lastBlocList[index]);
          }
        },
        itemCount: lastBlocList.length + 1,
      ),
      onRefresh: _refreshed,
    );
  }

  _getData() {
    String url = '/article/list/$currentPage/json?cid=${widget._id}';
    DioUtil.getInstance().get(url, (data) {
      List mlist = data['datas'];
      totalCount = data['total'];

      /// mounted 为 true 表示当前页面挂在到构件树中，为 false 时未挂载当前页面
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
