import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firstflutter/bean/datas.dart';
import 'package:firstflutter/utils/RouteUtils.dart';

/// @author: jm
/// @date: 2019/7/4 11:40
/// @Version:1.0
/// @Description:

class HomeBlocItem extends StatelessWidget {
  int index;
  List<Datas> bloclist;

  HomeBlocItem(this.index, this.bloclist);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Fluttertoast.showToast(msg: bloclist[index].link);
        Map<String, String> map = {
          "title": bloclist[index].title,
          "linkUrl": bloclist[index].link
        };
        RouteUtils.pushNamed(context, RouteUtils.WebViewPage, arguments: map);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(color: Colors.lightBlueAccent, width: 1),
            boxShadow: [
              BoxShadow(
                  color: Colors.lightBlueAccent,
                  blurRadius: 8,
                  offset: Offset(3, 3)),
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
                  "作者:${bloclist[index].author}",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.lightBlue),
                ),
                Expanded(
                  child: Text(
                    bloclist[index].superChapterName,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Text(
                bloclist[index].title,
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
                  "time:${bloclist[index].niceDate}",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.lightBlue),
                ),
              ],
            )
          ],
        ),
      ),
    );
    ;
  }
}
