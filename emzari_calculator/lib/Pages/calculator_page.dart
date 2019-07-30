import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  CalculatorPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String answer;
  String inputFull;
  String answerTemp;
  String operator;
  bool calculatorMode;

  @override
  void initState() {
    answer = '0';
    calculatorMode = false;
    operator = '';
    answerTemp = '';
    inputFull = '';

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
            _answerPad(),
            _numberPad(),
          ],
        ),
      ),
    );
  }

  //region Utils

  void addNumberToAnswer(int number) {
    setState(() {
      if (number == 0 && answer == '0') {

      } else if (number != 0 && answer == '0') {
        answer = number.toString();
      } else {
        answer += number.toString();
      }
    });
  }

  void removeAnswerLast() {
    if (answer == '0') {

    } else {
      setState(() {
        if (answer.length > 1) {
          answer = answer.substring(0, answer.length - 1);
          if (answer.length == 1 && (answer == '.' || answer == '-')) {
            answer = '0';
          }
        } else {
          answer = '0';
        }
      });
    }
  }

  void addDotToAnswer() {
    setState(() {
      if (!answer.contains('.')) {
        answer = answer + '.';
      }
    });
  }

  void addOperatorToAnswer(String op) {
    setState(() {
      if (answer != '0' && !calculatorMode) {
        calculatorMode = true;
        answerTemp = answer;
        inputFull += operator + ' ' + answerTemp;
        operator = op;
        answer = '0';
      } else if (calculatorMode) {
        if (answer.isNotEmpty) {
          calculate();
          answerTemp = answer;
          inputFull = '';
          operator = '';
        } else {
          operator = op;
        }
      }
    });
  }

  void calculate() {
    setState(() {
      if (calculatorMode) {
        bool decimalMode = false;
        double value = 0;
        if (answer.contains('.') || answerTemp.contains('.')) {
          decimalMode = true;
        }

        if (operator == '+') {
          value = (double.parse(answerTemp) + double.parse(answer));
        } else if (operator == '-') {
          value = (double.parse(answerTemp) - double.parse(answer));
        } else if (operator == 'x') {
          value = (double.parse(answerTemp) * double.parse(answer));
        } else if (operator == '/') {
          value = (double.parse(answerTemp) / double.parse(answer));
        }

        if (!decimalMode) {
          answer = value.toInt().toString();
        } else {
          answer = value.toString();
        }

        calculatorMode = false;
        operator = '';
        answerTemp = '';
        inputFull = '';
      }
    });
  }

  void clearAll() {
    setState(() {
      answer = '0';
      inputFull = '';
      calculatorMode = false;
      operator = '';
    });
  }

  void clearAnswer() {
    setState(() {
      answer = '0';
    });
  }

  void toggleNegative() {
    setState(() {
      if (answer.contains('-')) {
        answer = answer.replaceAll('-', '');
      } else {
        answer = '-' + answer;
      }
    });
  }

  //endregion

  //region Pads

  Widget _answerPad() {
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
                Text(answerTemp, style: TextStyle(fontSize: 18)),
                Text(answer, style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        )
    );
  }

  Widget _numberPad() {
    return Container(
      color: Color(0xffdbdbdb),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              _numberButton('CE', numberButton: false, onTap: () { clearAnswer(); }),
              _numberButton('C', numberButton: false, onTap: () { clearAll(); }),
              _numberButton('Del', numberButton: false, onTap: () { removeAnswerLast(); }),
              _numberButton('/', numberButton: false, onTap: () { addOperatorToAnswer('/'); }),
            ],
          ),
          Row(
            children: <Widget>[
              _numberButton('7', onTap: () { addNumberToAnswer(7); }),
              _numberButton('8', onTap: () { addNumberToAnswer(8); }),
              _numberButton('9', onTap: () { addNumberToAnswer(9); }),
              _numberButton('x', numberButton: false, onTap: () { addOperatorToAnswer('x'); }),
            ],
          ),
          Row(
            children: <Widget>[
              _numberButton('4', onTap: () { addNumberToAnswer(4); }),
              _numberButton('5', onTap: () { addNumberToAnswer(5); }),
              _numberButton('6', onTap: () { addNumberToAnswer(6); }),
              _numberButton('-', numberButton: false, onTap: () { addOperatorToAnswer('-'); }),
            ],
          ),
          Row(
            children: <Widget>[
              _numberButton('1', onTap: () { addNumberToAnswer(1); }),
              _numberButton('2', onTap: () { addNumberToAnswer(2); }),
              _numberButton('3', onTap: () { addNumberToAnswer(3); }),
              _numberButton('+', numberButton: false, onTap: () { addOperatorToAnswer('+'); }),
            ],
          ),
          Row(
            children: <Widget>[
              _numberButton('+/-', numberButton: false, onTap: () { toggleNegative(); }),
              _numberButton('0', onTap: () { addNumberToAnswer(0); }),
              _numberButton('.', numberButton: false, onTap: () { addDotToAnswer(); }),
              _numberButton('=', numberButton: false, onTap: () { calculate(); }),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberButton(String str, { @required Function() onTap, bool numberButton = true }) {
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

  //endregion
}
