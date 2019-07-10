import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

/// @author: jm
/// @date: 2019/7/5 10:32
/// @Version:1.0
/// @Description: webview

class WebViewPage extends StatefulWidget {
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  FlutterWebviewPlugin _flutterWebviewPlugin = new FlutterWebviewPlugin();
  bool _isLoadFinish = false;

  @override
  void initState() {
    super.initState();
    _flutterWebviewPlugin.onStateChanged.listen((event) {
      if (event.type == WebViewState.startLoad) {
        setState(() {
          _isLoadFinish = false;
        });
      } else if (event.type == WebViewState.finishLoad) {
        setState(() {
          _isLoadFinish = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map arguments = ModalRoute.of(context).settings.arguments;

    if (!arguments.containsKey('title') || !arguments.containsKey('linkUrl')) {
      return Scaffold(
        appBar: AppBar(
          title: Text("返回！"),
        ),
        body: Center(
          child: Text("数据解析异常!"),
        ),
      );
    }
    var title = arguments["title"];
    var linkUrl = arguments["linkUrl"];

    return new WebviewScaffold(
      url: linkUrl,
      scrollBar: true,
      withZoom: true,
      withJavascript: true,
      appBar: AppBar(
        title: Text(title),
        bottom: PreferredSize(
            child: _isLoadFinish
                ? Divider(
                    height: 0,
                  )
                : LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                  ),
            preferredSize: Size.fromHeight(1)),
      ),
    );
  }
}
