import 'package:flutter/material.dart';
import 'package:emzari_calculator/widgets/number_pad.dart';
import 'package:emzari_calculator/widgets/answer.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String answer;

  @override
  void initState() {
    answer = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffecf0f1),
        title: Text(widget.title, style: TextStyle(color: Colors.black)),
        elevation: 1,
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            answerWidget(),
            numPadWidget(),
          ],
        ),
      ),
    );
  }
}
