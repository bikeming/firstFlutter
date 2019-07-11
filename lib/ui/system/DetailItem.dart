import 'package:flutter/material.dart';
import 'package:firstflutter/utils/RouteUtils.dart';

/// @author: jm
/// @date: 2019/7/8 17:49
/// @Version:1.0
/// @Description:

class DetailItem extends StatelessWidget {
  dynamic datas;

  DetailItem(this.datas);

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
                  "作者:${datas['author']}",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.lightBlue),
                ),
                Expanded(
                  child: Text(
                    datas['superChapterName'],
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(10),
              child: Text(
                datas['title'],
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
                  "time:${datas['niceDate']}",
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
