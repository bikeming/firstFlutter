import 'package:flutter/material.dart';

/// @author: jm
/// @date: 2019/7/1 14:09
/// @Version:1.0
/// @Description:命名路由中的KEY统一管理

class RouteUtils {
  ///登录页
  static const LOGINPAGE = "page_login";

  ///主页面
  static const MAINPAGE = "page_main";

  ///webview
  static const WebViewPage = "page_webview";

  ///体系页面二级页面
  static const SystemDetailPage = "SystemDetailPage";

  ///五子棋页面
  static const GoBangPage = "GoBangPage";

  static void pushNamed(BuildContext buildContext, String routeKey,
      {arguments: Object}) {
    Navigator.pushNamed(buildContext, routeKey, arguments: arguments);
  }

  static void pushReplacementNamed(BuildContext buildContext, String routeKey,
      {arguments: Object}) {
    Navigator.pushReplacementNamed(buildContext, routeKey, arguments: arguments);
  }

  static void pushNamedAndRemoveUntil(
      BuildContext context, String newRouteName, RoutePredicate predicate,
      {arguments: Object}) {
    Navigator.pushNamedAndRemoveUntil(context, newRouteName, predicate,
        arguments: arguments);
  }
}
