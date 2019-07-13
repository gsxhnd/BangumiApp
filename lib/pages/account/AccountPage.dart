import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../components/NeedLoginWidget.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _userToken;

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userToken = prefs.get("userToken");
  }

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: NeedLoginWidget(),
    );
  }
}
