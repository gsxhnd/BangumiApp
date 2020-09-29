import 'package:flutter/material.dart';

class NeedLoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text("使用Bangumi账号登陆"),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (route) => route == null);
            },
            child: Text("登入"),
          )
        ],
      ),
    );
  }
}
