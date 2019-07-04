import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:firstflutter/http/DioUtil.dart';
import 'package:firstflutter/bean/HomeBannerBean.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firstflutter/bean/HomeBlocBean.dart';

/// @author: jm
/// @date: 2019/7/1 13:44
/// @Version:1.0
/// @Description:

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();
  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: EasyRefresh(
          key: _easyRefreshKey,
          child: Column(
            children: <Widget>[
              ///轮播图

              HomeBannerWidget(),

              ///博客列表

              HomeBlocWidget(),
            ],
          ),
        ));
  }
}

class HomeBannerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getHomeBanner(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List bannerList = snapshot.data;
          List<HomeBannerBean> list = new List();
          for (int i = 0; i < bannerList.length; i++) {
            list.add(HomeBannerBean.fromJsonMap(bannerList[i]));
          }
          return Container(
            height: ScreenUtil.screenHeight * 1 / 5,
            width: ScreenUtil.screenWidth,
            child: RefreshSafeArea(
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
                  },
                );
              },
            )),
          );
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
}

class HomeBlocWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getBlocList(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            HomeBlocBean blocBean = HomeBlocBean.fromJsonMap(snapshot.data);

            return Container(
              height: ScreenUtil().setHeight(999),
              width: ScreenUtil.screenWidth,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Fluttertoast.showToast(msg: blocBean.datas[index].link);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                              color: Colors.lightBlueAccent, width: 2),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.lightBlueAccent,
                                blurRadius: 8,
                                offset: Offset(5, 5)),
                          ]),
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(6),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                "作者:${blocBean.datas[index].author}",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                              Expanded(
                                child: Text(
                                  blocBean.datas[index].superChapterName,
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            child: Text(
                              blocBean.datas[index].title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.access_time,
                                color: Colors.grey,
                              ),
                              Text(
                                "time:${blocBean.datas[index].niceDate}",
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.lightBlue),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: blocBean.datas.length,
              ),
            );
          } else {
            return Container(
              alignment: Alignment.center,
              height: ScreenUtil.screenHeight * 4 / 5,
              width: ScreenUtil.screenWidth,
              child: Text("loadError"),
            );
          }
        });
  }
}

Future _getHomeBanner() {
  return DioUtil.getInstance().requst(Method.GET, "/banner/json");
}

Future _getBlocList() {
  return DioUtil.getInstance().requst(Method.GET, "/article/list/0/json");
}
