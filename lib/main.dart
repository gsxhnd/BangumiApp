import 'package:flutter/material.dart';


import 'views/account/login.dart';


import 'views/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 183, 50, 39)),
        brightness: Brightness.light,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: IconThemeData(color: Colors.white),
//        iconTheme: IconThemeData(color: Colors.white),
        tabBarTheme: TabBarTheme(labelColor: Colors.white),
      ),
      home: SplashScreen(),
      routes: {
        "/login": (BuildContext context)=>new LoginPage(),
      },
    );
  }
}