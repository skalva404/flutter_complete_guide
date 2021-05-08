import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String text;
  final Function answerQuestion;

  Answer(this.text, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: 100,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        child: Text(text),
        onPressed: answerQuestion,
      ),
    );
  }
}
