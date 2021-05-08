import 'package:flutter/material.dart';

import 'components/QnA.dart';
import 'components/Result.dart';
import 'components/AppBar.dart';
import 'components/MyDrawer.dart';
import './theme/Style.dart';

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

  final List<Map<String, Object>> questions = const [
    {
      'question': 'What\'s you favorite color ?',
      'answers': [
        {'text': 'red', 'score': 15},
        {'text': 'green', 'score': 8},
        {'text': 'black', 'score': 10},
        {'text': 'white', 'score': 3},
      ]
    },
    {
      'question': 'What\'s your favorite animal ?',
      'answers': [
        {'text': 'dog', 'score': 15},
        {'text': 'cat', 'score': 8},
        {'text': 'rabbit', 'score': 10},
        {'text': 'reptile', 'score': 3},
      ]
    },
    {
      'question': 'What\'s your favorite dish ?',
      'answers': [
        {'text': 'pizza', 'score': 15},
        {'text': 'pasta', 'score': 8},
        {'text': 'biriyani', 'score': 10},
        {'text': 'burger', 'score': 3},
      ]
    }
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _ctr = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _totalScore += score;
      _ctr++;
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
        body: _ctr <= questions.length - 1
            ? QnA(questions[_ctr]['question'], questions[_ctr]['answers'],
                _answerQuestion)
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
