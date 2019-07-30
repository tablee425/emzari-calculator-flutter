import 'package:flutter/material.dart';
import 'package:emzari_calculator/pages/calculator_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorPage(title: 'CALCULATOR'),
    );
  }
}
