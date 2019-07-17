import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'progress/ProgressPage.dart';
import 'rakuen/RakuenPage.dart';
import 'timeline/TimeLinePage.dart';
import 'account/AccountPage.dart';

import '../api/auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _title = ["", "", "", ""];
  int _currentIndex = 0;
  List _pageList = [TimeLinePage(), ProgressPage(), RakuenPage(), AccountPage()];
  PageController _controller = PageController(initialPage: 0);

  void _pageChange(int index) {
    if (index != _currentIndex) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  /// 1.获取用户信息
  /// 2.判断token是否过期
  void _getUserState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String _accessToken = prefs.getString("accessToken");
    await AuthRequest.getAccessTokenStatus(_accessToken).then((val) {});
  }

  @override
  void initState() {
    _getUserState();
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
        selectedItemColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_time), title: Text("时间胶囊")),
          BottomNavigationBarItem(
              icon: Icon(MdiIcons.compassOutline), title: Text("超展开")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), title: Text("进度")),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outline), title: Text("个人中心")),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          print(_title[index]);
          _controller.jumpToPage(index);
        },
      ),
    );
  }
}
