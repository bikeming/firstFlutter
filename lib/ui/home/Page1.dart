import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/bean/HomeBannerBean.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firstflutter/bean/HomeBlocBean.dart';
import 'package:firstflutter/ui/home/HomeBlocItem.dart';
import 'package:firstflutter/bean/datas.dart';
import 'package:firstflutter/utils/RouteUtils.dart';
import 'package:firstflutter/widgets/LoadEndWidget.dart';
import 'package:firstflutter/widgets/LoadingWidget.dart';

/// @author: jm
/// @date: 2019/7/1 13:44
/// @Version:1.0
/// @Description:首页

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentPage = 0;
  int _totalCount = 0;
  ScrollController scrollController;
  List<Datas> _blocList = new List();

  @override
  void initState() {
    super.initState();

    _getBlocList();

    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      double maxScroll = position.maxScrollExtent;
      double pixels = position.pixels;
      if (pixels == maxScroll && _blocList.length < _totalCount) {
        Future.delayed(Duration(seconds: 1), () {
          currentPage++;
          _getBlocList();
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          child: Column(
            children: <Widget>[
              ///轮播图
              Expanded(
                child: _homeBannerWidget(),
                flex: 1,
              ),

              ///博客列表
              Expanded(
                child: _homeBlocWidget(),
                flex: 3,
              ),
            ],
          ),
          onRefresh: _onrefresh,
        ));
  }

  ///博客列表Widget
  Widget _homeBlocWidget() {
    if (_blocList.isEmpty) {
      return LoadingWidget(
        loadText: '加载中...',
      );
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == _blocList.length) {
          if (_blocList.length < _totalCount) {
            return LoadEndWidget("加载中...");
          } else {
            return LoadEndWidget("已经到头了");
          }
        } else {
          return new HomeBlocItem(index, _blocList);
        }
      },
      itemCount: _blocList.length + 1, //最底部加一条“加载更多”或者“没有更多”
      controller: scrollController,
    );
  }

  ///轮播图Widget
  Widget _homeBannerWidget() {
    return FutureBuilder(
      future: _getHomeBanner(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List bannerList = snapshot.data;
          List<HomeBannerBean> list = new List();
          for (int i = 0; i < bannerList.length; i++) {
            list.add(HomeBannerBean.fromJsonMap(bannerList[i]));
          }
          return Swiper(
            itemCount: list.length,
            autoplay: true,
            pagination: new SwiperPagination(),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: Image.network(
                  list[index].imagePath,
                  fit: BoxFit.fill,
                ),
                onTap: () {
                  Fluttertoast.showToast(msg: list[index].title);
                  Map<String, String> map = {
                    "title": list[index].title,
                    "linkUrl": list[index].url
                  };
                  RouteUtils.pushNamed(context, RouteUtils.WebViewPage,
                      arguments: map);
                },
              );
            },
          );
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Future<void> _onrefresh() async {
    await this.setState(() {
      currentPage = 0;
      _getBlocList();
    });
  }

  Future _getHomeBanner() {
    return DioUtil.getInstance().requst(Method.GET, "/banner/json");
  }

  _getBlocList() {
    DioUtil.getInstance().get("/article/list/$currentPage/json", (response) {
      if (mounted)
        setState(() {
          HomeBlocBean blocBean = HomeBlocBean.fromJsonMap(response);
          _totalCount = blocBean.total;
          if (currentPage == 0) {
            _blocList.clear();
          }
          _blocList.addAll(blocBean.datas);
        });
    });
  }
}
