import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginForm = GlobalKey<FormState>();
  String _userName;
  String _userPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Container(
            alignment: Alignment.center,
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Form(
                key: _loginForm,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/logo.png',
                        scale: 1.0, //进行缩放
                        fit: BoxFit.cover // 充满父容器
                        ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: '请输入账号',
                        labelText: 'Name',
                      ),
                      onSaved: (String value) {
                        setState(() {
                          _userName = value;
                        });
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: '请输入密码',
                        labelText: 'Password',
                      ),
                      obscureText: true,
                      onSaved: (String value) {
                        setState(() {
                          _userPassword = value;
                        });
                      },
                      validator: (String value) {
                        return value.contains('@')
                            ? 'Do not use the @ char.'
                            : null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("登录"),
                        color: Colors.lightBlue,
                        onPressed: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          if (_loginForm.currentState.validate()) {
                            _loginForm.currentState.save();
                            if (_userName == _userPassword &&
                                _userName == "admin") {
                              prefs.setString("userToken", "true");
                              String userToken = prefs.getString("userToken");
                              print(userToken);
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new LoginPage()),
                                  (route) => route == null);
                            }
                          }
                        },
                      ),
                    )
                  ],
                ))));
  }
}
