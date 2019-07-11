import 'package:flutter/material.dart';
import 'package:firstflutter/utils/RouteUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firstflutter/widgets/TitleWidget.dart';

/// @author: jm
/// @date: 2019/7/11 11:32
/// @Version:1.0
/// @Description:

class ProjectTabBarViewItem extends StatelessWidget {
  dynamic datas;

  ProjectTabBarViewItem(this.datas);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Map<String, String> map = {
          "title": datas['title'],
          "linkUrl": datas['link']
        };
        RouteUtils.pushNamed(context, RouteUtils.WebViewPage, arguments: map);
      },
      child: Container(
        height: ScreenUtil().setHeight(333),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.lightBlueAccent, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.lightBlueAccent,
                  blurRadius: 8,
                  offset: Offset(5, 5)),
            ]),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(6),
        child: Row(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.network(
                      datas['envelopePic'],
                      fit: BoxFit.fill,
                    ))),
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TitleWidget(
                        Text(
                          datas['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        titleLeft: Icon(
                          Icons.android,
                          color: Colors.lightBlue,
                        ),
                      ),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                datas['desc'],
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ))),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(
                            "作者:${datas['author']}",
                            textAlign: TextAlign.left,
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                          Expanded(
                            child: Text(
                              datas['niceDate'],
                              textAlign: TextAlign.right,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
    ;
  }
}
