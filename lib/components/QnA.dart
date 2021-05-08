import 'package:flutter/material.dart';

import 'Questions.dart';
import 'Answer.dart';

class QnA extends StatelessWidget {
  final String question;
  final Object answers;
  final Function answerQuestion;

  QnA(this.question, this.answers, this.answerQuestion);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Question(question),
          ...(answers as List<Map<String, Object>>).map((answer) {
            return Answer(answer['text'], () => answerQuestion(answer['score']));
          }).toList(),
        ],
      ),
    );
  }
}
