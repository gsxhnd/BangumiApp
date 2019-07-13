import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/auth.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  void _skipLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("skipLogin", true).then((_) {
      Navigator.of(context).pushReplacementNamed("/home");
    });
  }

  void _getAccessToken(String code) async {
    AuthRequest.getAccessToken(code).then((val) {
      print(val);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/login.png",
                scale: 2.0,
                fit: BoxFit.fill,
              ),
              RaisedButton(
                child: Text(
                  "登陆",
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: () async {
                  final _code = await Navigator.of(context).pushNamed("/loginWebView");
                  print(_code);
                  print(_code.runtimeType);
                  if (_code.runtimeType == String) {
                    if (_code.toString().isNotEmpty) {
                      _getAccessToken(_code);
                    }
                  }
                },
              ),
              RaisedButton(
                child: Text(
                  "游客访问",
                  style: Theme.of(context).textTheme.button,
                ),
                onPressed: _skipLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
