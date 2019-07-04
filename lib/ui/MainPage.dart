import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firstflutter/ui/home/Page1.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';

/// @author: jm
/// @date: 2019/7/1 13:38
/// @Version:1.0
/// @Description: 主界面
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
//  final String userName;
//
//  MainPage({this.userName});

}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  List<Widget> _tabViewList = [Page1(), Page2(), Page3(), Page4()];
  List<BottomNavigationBarItem> _bottomNavigationBarItemList = [
    new BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("page1")),
    new BottomNavigationBarItem(
        icon: Icon(Icons.headset), title: Text("page2")),
    new BottomNavigationBarItem(
        icon: Icon(Icons.open_with), title: Text("page3")),
    new BottomNavigationBarItem(icon: Icon(Icons.mood), title: Text("page4")),
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
    var userName = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(userName != null ? userName : "aa"),
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
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new Center(
          child: Text(
        "Mydrawer",
        style: TextStyle(fontSize: 20, color: Colors.lightBlue),
      )),
    );
  }
}
