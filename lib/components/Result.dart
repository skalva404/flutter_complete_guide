import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final Function _resetQuiz;

  Result(this._totalScore, this._resetQuiz);

  String get totalScoreString {
    var retStrinig = 'Hurray you did it';
    if (_totalScore <= 9) {
      retStrinig = 'You are awesome and innocent ...!';
    } else if (_totalScore <= 24) {
      retStrinig = 'You are kool and dangerous ...!';
    } else if (_totalScore <= 24) {
      retStrinig = 'You are kool and dangerous ...!';
    } else if (_totalScore <= 30) {
      retStrinig = 'You are weird  ...!';
    } else if (_totalScore <= 45) {
      retStrinig = 'You are best  ...!';
    }
    return retStrinig;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            totalScoreString,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(onPressed: _resetQuiz, child: Text("Restart Quiz ... !"))
        ],
      ),
    );
  }
}
