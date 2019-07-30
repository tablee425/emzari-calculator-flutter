import 'package:flutter/material.dart';
import 'package:emzari_calculator/widgets/number_button.dart';

Widget numPadWidget() {
  return Container(
    color: Color(0xffdbdbdb),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Row(
          children: <Widget>[
            numberButton('CE', numberButton: false, onTap: null),
            numberButton('C', numberButton: false, onTap: null),
            numberButton('Del', numberButton: false, onTap: null),
            numberButton('/', numberButton: false, onTap: null),
          ],
        ),
        Row(
          children: <Widget>[
            numberButton('7', onTap: null),
            numberButton('8', onTap: null),
            numberButton('9', onTap: null),
            numberButton('x', numberButton: false, onTap: null),
          ],
        ),
        Row(
          children: <Widget>[
            numberButton('4', onTap: null),
            numberButton('5', onTap: null),
            numberButton('6', onTap: null),
            numberButton('-', numberButton: false, onTap: null),
          ],
        ),
        Row(
          children: <Widget>[
            numberButton('1', onTap: null),
            numberButton('2', onTap: null),
            numberButton('3', onTap: null),
            numberButton('+', numberButton: false, onTap: null),
          ],
        ),
        Row(
          children: <Widget>[
            numberButton('+/-', numberButton: false, onTap: null),
            numberButton('0', onTap: null),
            numberButton('.', numberButton: false, onTap: null),
            numberButton('=', numberButton: false, onTap: null),
          ],
        ),
      ],
    ),
  );
}