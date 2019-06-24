import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ScaffoldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ScaffoldState();
  }
}

class ScaffoldState extends State<ScaffoldWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  List<Tab> tabs = [
    Tab(
      child: Text("语文"),
    ),
    Tab(
      child: Text("数学"),
    ),
    Tab(
      child: Text("英语"),
    ),
    Tab(
      child: Text("语文"),
    ),
  ];
  TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("scaffold"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
//              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[Icon(Icons.share)],
        bottom: new TabBar(
          tabs: tabs,
          isScrollable: false,
          controller: controller,
        ),
      ),
      body: TabBarView(
        children: tabs,
        controller: controller,
      ),
      drawer: new MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _obFabClick,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("主页")),
          BottomNavigationBarItem(icon: Icon(Icons.hotel), title: Text("主页2")),
          BottomNavigationBarItem(icon: Icon(Icons.hot_tub), title: Text("主页3"))
        ],
        currentIndex: _currentIndex,
        onTap: _ontaped,
      ),
    );
  }

  void _ontaped(int value) {
    setState(() {
      this._currentIndex = value;
    });
  }
}

void _obFabClick() {
  Fluttertoast.showToast(msg: "fabClick");
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
