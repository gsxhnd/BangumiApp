import 'package:flutter/material.dart';


class MenuCardRow extends StatelessWidget {
  final firstLabel;
  final IconData firstIcon;
  final firstIconColor;
  final firstOnPress;
  final secondLabel;
  final IconData secondIcon;
  final secondIconColor;
  final secondOnPress;

  const MenuCardRow({
    Key key,
    this.firstLabel,
    this.firstIcon,
    this.firstIconColor,
    this.firstOnPress,
    this.secondLabel,
    this.secondIcon,
    this.secondIconColor,
    this.secondOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                onTap: firstOnPress,
                child: Row(
                  children: <Widget>[
                    Icon(
                      firstIcon,
                      size: 30,
                      color: firstIconColor,
                    ),
                    Text(
                      firstLabel,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),

            ),
            flex: 50,
          ),
          Flexible(
            child: VerticalDivider(
              width: 0,
            ),
          ),
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.all(10),
              child: GestureDetector(
                child: Row(
                  children: <Widget>[
                    Icon(
                      secondIcon,
                      size: 30,
                      color: secondIconColor,
                    ),
                    Text(
                      secondLabel,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                onTap: secondOnPress,
              ),
            ),
            flex: 50,
          ),
        ],
      ),
      height: 80,
    );
  }
}
