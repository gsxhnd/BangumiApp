import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:uri/uri.dart';

class LoginWebViewPage extends StatefulWidget {
  @override
  _LoginWebViewPageState createState() => _LoginWebViewPageState();
}

class _LoginWebViewPageState extends State<LoginWebViewPage> {
  final flutterWebViewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
    super.initState();
    // Add a listener to on url changed
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        if (RegExp('^http://code').hasMatch(url)) {
          String code = url.substring("http://code/?code=".length);
          Navigator.of(context).pop(code);
        }
      }
    });
//    flutterWebViewPlugin.cleanCookies();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url:
            "https://bgm.tv/oauth/authorize?client_id=bgm9015c6118aa20348&response_type=code&redirect_uri=http://code",
      appBar: AppBar(),
    );
  }
}
