import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

showPhotoView(context, src, {type = "local"}) {
  return showGeneralDialog(
    context: context,
    barrierLabel: "",
    barrierDismissible: false,
    barrierColor: Color.fromARGB(200, 0, 0, 0),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (BuildContext context, Animation animation,
        Animation secondaryAnimation) {
      return Stack(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
              child: PhotoView(
                imageProvider:
                    type == "local" ? FileImage(src) : NetworkImage("" + src),
              )),
          Container(
              padding: EdgeInsets.fromLTRB(0, 40, 20, 0),
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.highlight_off, color: Colors.white, size: 30),
              ))
        ],
      );
    },
  );
}
