import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firstflutter/ui/home/Page1.dart';
import 'package:firstflutter/ui/system/Page2.dart';
import 'package:firstflutter/ui/navigator/Page3.dart';
import 'package:firstflutter/ui/project/Page4.dart';
import 'UserCenterDrawer.dart';

/// @author: jm
/// @date: 2019/7/1 13:38
/// @Version:1.0
/// @Description: 主界面
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> _tabViewList = [Page1(), Page2(), Page3(), Page4()];
  List<BottomNavigationBarItem> _bottomNavigationBarItemList = [
    new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("首页")),
    new BottomNavigationBarItem(icon: Icon(Icons.headset), title: Text("体系")),
    new BottomNavigationBarItem(icon: Icon(Icons.open_with), title: Text("导航")),
    new BottomNavigationBarItem(icon: Icon(Icons.mood), title: Text("项目")),
  ];
  int _currentIndex = 0;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        new TabController(length: _tabViewList.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    var userName = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
//        title: Text(userName != null ? userName : "aa"),
        title:
            Text((_bottomNavigationBarItemList[_currentIndex].title as Text).data),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Fluttertoast.showToast(msg: "wainting");
            },
          )
        ],
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer());
        }),
      ),
      body: TabBarView(
        children: _tabViewList,
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(), //禁用tabbarview滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItemList,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed, //BottomNavigationBar超过3个不加这个属性会不显示
        onTap: (index) => this.setState(() {
          _currentIndex = index;
          _tabController.index = index;
        }),
      ),
      drawer: UserCenterDrawer(),
    );
  }
}
