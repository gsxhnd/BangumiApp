import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonColor: Color.fromARGB(255, 183, 50, 39),
        appBarTheme: AppBarTheme(color: Color.fromARGB(255, 183, 50, 39)),
        brightness: Brightness.light,
        primaryTextTheme: TextTheme(title: TextStyle(color: Colors.white)),
        primaryIconTheme: IconThemeData(color: Colors.white),
//        iconTheme: IconThemeData(color: Colors.white),
        tabBarTheme: TabBarTheme(labelColor: Colors.white),
        buttonTheme: ButtonThemeData(buttonColor: Color.fromARGB(255, 183, 50, 39),textTheme: ButtonTextTheme.primary),
      ),
      home: SplashScreen()
    );
  }
}