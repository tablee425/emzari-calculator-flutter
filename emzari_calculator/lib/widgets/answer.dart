import 'package:flutter/material.dart';

Widget answerWidget() {
  return Expanded(
    child: Container(
      padding: EdgeInsets.all(16.0),
      color: Color(0xffdbdbdb),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Small', style: TextStyle(fontSize: 18)),
            Text('Large Answer', style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    )
  );
}