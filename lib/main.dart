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
  var _optionSelected = 0;
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _optionSelected = 0;
      _questionIndex = 0;
    });
  }

  void _scoreAnswer(int optionSelected, int score) {
    setState(() {
      _totalScore += score;
      _optionSelected = optionSelected;
    });
  }

  void _moveToNextQuestion(int index) {
    setState(() {
      _questionIndex = index;
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
          child: MyDrawer(_moveToNextQuestion),
        ),
        body: _questionIndex <= QUESTIONS.length - 1
            ? QnA(
                _optionSelected,
                QUESTIONS[_questionIndex]['question'],
                QUESTIONS[_questionIndex]['answers'],
                _scoreAnswer,
                _moveToNextQuestion,
                _questionIndex)
            : Result(_totalScore, _resetQuiz),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _resetQuiz();
          },
          child: const Icon(Icons.refresh),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
