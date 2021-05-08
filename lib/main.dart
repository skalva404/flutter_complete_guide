import 'package:flutter/material.dart';

import 'components/QnA.dart';
import 'components/Result.dart';
import 'components/AppBar.dart';
import 'components/MyDrawer.dart';
import './theme/Style.dart';
import './Constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _ctr = 0;
  var _totalScore = 0;
  var _selectedDestination = 0;

  void _resetQuiz() {
    setState(() {
      _selectedDestination = 0;
      _totalScore = 0;
      _ctr = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _selectedDestination = 0;
      _totalScore += score;
      _ctr++;
      _selectedDestination = _ctr;
      // _ctr = (_ctr + 1) > questions.length - 1 ? 0 : (_ctr + 1);
    });
  }

  void _selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: MyAppBar().build(),
        drawer: Drawer(
          child: MyDrawer(_selectDestination),
        ),
        body:
            // int index = 1;
            _ctr <= QUESTIONS.length - 1
                ? QnA(QUESTIONS[_selectedDestination]['question'], QUESTIONS[_selectedDestination]['answers'],
                    _answerQuestion)
                : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
