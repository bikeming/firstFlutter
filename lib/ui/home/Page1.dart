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

/// @author: jm
/// @date: 2019/7/1 13:44
/// @Version:1.0
/// @Description:

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentPage = 0;
  int _totalCount = 0;
  ScrollController scrollController;
  List<Datas> lastBlocList = new List();

  @override
  void initState() {
    super.initState();
    scrollController = new ScrollController();
    scrollController.addListener(() {
      ScrollPosition position = scrollController.position;
      double maxScroll = position.maxScrollExtent;
      double pixels = position.pixels;
      if (pixels == maxScroll) {
        _onLoadMore();
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
    return FutureBuilder(
        future: _getBlocList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            HomeBlocBean blocBean = HomeBlocBean.fromJsonMap(snapshot.data);
          _totalCount=  blocBean.total;
            List<Datas> newBlocList = new List();
            newBlocList.addAll(lastBlocList);
            if (currentPage == 0) {
              newBlocList.clear();
            }
            newBlocList.addAll(blocBean.datas);
            lastBlocList = newBlocList;

            return ListView.builder(
              itemBuilder: (context, index) {
                if (index == newBlocList.length) {
                  if (currentPage < blocBean.pageCount) {
                    return loadMoreWidget("加载中...");
                  } else {
                    return loadMoreWidget("已经到头了");
                  }
                } else {
                  return new HomeBlocItem(index, newBlocList);
                }
              },
              itemCount: newBlocList.length + 1, //最底部加一条“加载更多”或者“没有更多”
              controller: scrollController,
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    strokeWidth: 1.0,
                  ),
                  Text("加载中...")
                ],
              ),
            );
          }
        });
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
          return RefreshSafeArea(
              child: Swiper(
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
          ));
        } else {
          return Container(
            alignment: Alignment.center,
            height: ScreenUtil.screenHeight * 1 / 5,
            width: ScreenUtil.screenWidth,
            child: Text("loadError"),
          );
        }
      },
    );
  }

  Future<void> _onrefresh() async {
    await this.setState(() {
      currentPage = 0;
    });
  }

  void _onLoadMore() async {
    await Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentPage++;
      });
    });
  }

  Future _getHomeBanner() {
    print("_getHomeBanner");
    return DioUtil.getInstance().requst(Method.GET, "/banner/json");
  }

  Future _getBlocList() {
    print("_getBlocList$currentPage");
    return DioUtil.getInstance()
        .requst(Method.GET, "/article/list/$currentPage/json");
  }

  ///加载更多
  Widget loadMoreWidget(String text) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.lightBlue,
              ),
            ),
            text == "加载中"
                ? new CircularProgressIndicator(
                    strokeWidth: 1.0,
                  )
                : null
          ],
        ),
      ),
    );
  }
}
