import 'package:bangumi/api/auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../components/NeedLoginWidget.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _accessToken;

  _getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _accessToken = prefs.getString("access_token");
    });

  }

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_accessToken == null) {
      return Container(
        child: NeedLoginWidget(),
      );
    } else {
      return Container(
        child: Text(_accessToken),
      );
    }
  }
}
