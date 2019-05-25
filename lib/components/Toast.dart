import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Toast {
  void normal (String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Color.fromARGB(190, 0, 0, 0),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void success (String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Color.fromARGB(190, 0, 0, 0),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void fail (String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Color.fromARGB(190, 183, 50, 39),
        textColor: Colors.white,
        fontSize: 16.0);
  }
}