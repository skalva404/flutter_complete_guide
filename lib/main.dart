import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/model/Scores.dart';

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
  var _questionIndex = 0;
  Scores _scores = Scores.init();

  void _resetQuiz() {
    setState(() {
      _scores = Scores.init();
      _questionIndex = 0;
    });
  }

  void _moveToNextQuestion(int questionIndex) {
    setState(() {
      _questionIndex = questionIndex;
    });
  }

  void _scoreAnswer(int questionIndex, int optionSelected, int score) {
    setState(() {
      _scores.setScore(questionIndex, Answer(score, optionSelected));
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
                this._scores,
                QUESTIONS[_questionIndex]['question'],
                QUESTIONS[_questionIndex]['answers'],
                _scoreAnswer,
                _moveToNextQuestion,
                _questionIndex)
            : Result(_scores.getTotalScore(), _resetQuiz),
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
