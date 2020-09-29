import 'package:flutter/material.dart';

import 'progress/ProgressPage.dart';
import 'timeline/TimeLinePage.dart';
import 'account/AccountPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _title = ["时间胶囊", "进度", "个人中心"];
  int _currentIndex = 0;
  List _pageList = [TimeLinePage(), ProgressPage(), AccountPage()];
  PageController _controller = PageController(initialPage: 0);

  void _pageChange(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title[_currentIndex]),
        actions: <Widget>[],
      ),
      body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),
          //viewPage禁止左右滑动
          onPageChanged: _pageChange,
          controller: _controller,
          itemCount: _pageList.length,
          itemBuilder: (context, index) => _pageList[index]),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color.fromARGB(255, 240, 145, 153),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text("时间胶囊")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text("进度")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("个人中心")),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
