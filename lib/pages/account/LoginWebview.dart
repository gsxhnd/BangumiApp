import 'dart:async';
import 'package:bangumi/config.dart';
import 'package:bangumi/api/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/Toast.dart';

class LoginWebViewPage extends StatefulWidget {
  @override
  _LoginWebViewPageState createState() => _LoginWebViewPageState();
}

class _LoginWebViewPageState extends State<LoginWebViewPage> {
  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;
  String redirectUri = config.redirectUri;
  String appId = config.appId;
  String accessToken, refreshToken, userId;

  Future _setToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("access_token", accessToken).then((_) {
      return prefs.setString("refresh_token", refreshToken);
    });
  }

  @override
  void initState() {
    super.initState();
    // Add a listener to on url changed
    flutterWebViewPlugin.onUrlChanged.listen((String url) async {
      if (mounted) {
        if (RegExp('^$redirectUri').hasMatch(url)) {
          print("url is match");
          String code = url.substring("$redirectUri?code=".length);
          await AuthRequest.getAccessToken(code).then((v) {
            accessToken = v.data['data']['access_token'];
            refreshToken = v.data['data']['refresh_token'];
            if (accessToken == "" || refreshToken == "") {
              Toast.fail("登入失败，稍后重试");
              flutterWebViewPlugin.clearCache();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("/login", (route) => route == null);
            } else {
              _setToken().then((_) {
                Toast.success("登入成功");
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/home", (route) => route == null);
              });
            }
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      // https://bgm.tv/oauth/authorize?client_id=bgm13805e31595be3d6d&response_type=code&redirect_uri=http://192.168.4.238:8080/code
      url:
          "https://bgm.tv/oauth/authorize?client_id=$appId&response_type=code&redirect_uri=$redirectUri",
      appBar: AppBar(
        title: Text("login"),
      ),
    );
  }
}
