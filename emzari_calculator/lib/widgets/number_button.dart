import 'package:flutter/material.dart';

Widget numberButton(String str, { @required Function() onTap, bool numberButton = true }) {
  Widget widget;
  if (numberButton) {
    widget = Container(
      margin: EdgeInsets.all(1.0),
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap, splashColor: Colors.blue,
          child: Container(
            height: 70,
            child: Center(
              child: Text(str, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  } else {
    widget = Container(
      margin: EdgeInsets.all(1.0),
      child: Material(
        color: Color(0xffecf0f1),
        child: InkWell(
          onTap: onTap, splashColor: Colors.blue,
          child: Container(
            height: 70,
            child: Center(
              child: Text(str, style: TextStyle(fontSize: 28)),
            ),
          ),
        ),
      ),
    );
  }
  return Expanded(child: widget);
}