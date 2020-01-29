import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

import 'pages/HomePage.dart';
import 'pages/account/LoginPage.dart';
import 'pages/account/LoginWebview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bangumi',
      theme: ThemeData(
          primarySwatch: Colors.blue,
//        buttonColor: Color.fromARGB(255, 183, 50, 39),
          buttonColor: Colors.white,
          brightness: Brightness.light,
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 240, 145, 153)),
          textTheme: TextTheme(
              title: TextStyle(color: Colors.white),
              button: TextStyle(color: Colors.white)),
          primaryTextTheme: TextTheme(
              title: TextStyle(color: Colors.white),
              button: TextStyle(color: Colors.white)),
          primaryIconTheme: IconThemeData(color: Colors.white),
          tabBarTheme: TabBarTheme(labelColor: Colors.white),
          buttonTheme: ButtonThemeData(
            buttonColor: Color.fromARGB(255, 240, 145, 153),
            minWidth: double.infinity,
          ),
          bottomAppBarTheme:
              BottomAppBarTheme(color: Color.fromARGB(255, 240, 145, 153))),
      home: SplashScreen(),
      routes: {
        "/home": (BuildContext context) => new HomePage(),
        "/login": (BuildContext context) => new LoginPage(),
        "/loginWebView": (BuildContext context) => new LoginWebViewPage(),
      },
    );
  }
}
