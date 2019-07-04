import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'package:bangumi/pages/account/LoginPage.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  String _userToken;
  bool _isLogin = false;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:3000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);
    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
//        Navigator.of(context).pushAndRemoveUntil(
//            MaterialPageRoute(builder: (context)=> _isLogin ? ConsolePage() : LoginPage()),
//                (route)=> route==null);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=> LoginPage()),
                (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition( //透明度动画组件
      opacity: _animation,  //执行动画
      child: Container(
        color: Colors.white,
        child: Image.asset(
            'assets/welcome.png',
            scale: 1.0,  //进行缩放
            fit:BoxFit.fill  // 充满父容器
        ),
      )
    );
  }
}