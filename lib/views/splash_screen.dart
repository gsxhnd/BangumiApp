import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'account/login.dart';
//import 'console/mainPage.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;
  String _userToken;

  void initState() {
    super.initState();
    _controller = AnimationController(vsync:this,duration:Duration(milliseconds:3000));
    _animation = Tween(begin: 0.0,end:1.0).animate(_controller);
    _getLoginState();


    /*动画事件监听器，
    它可以监听到动画的执行状态，
    我们这里只监听动画是否结束，
    如果结束则执行页面跳转动作。 */
    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed){
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context)=> _userToken == "true" ? LoginPage() : LoginPage()),
                (route)=> route==null);
      }
    });
    //播放动画
    _controller.forward();
  }

  void _getLoginState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userToken = prefs.get("userToken");
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
      child: Image.asset(
          'assets/launch-02.jpg',
          scale: 1.0,  //进行缩放
          fit:BoxFit.cover  // 充满父容器
      ),
    );
  }
}