import 'package:flutter/material.dart';

import '../model/Scores.dart';
import './CustomDialog.dart';

class RadioAnswer extends StatelessWidget {
  final Scores scores;
  final Function scoreAnswer;
  final int questionIndex;
  final List<Map<String, Object>> answers;

  RadioAnswer(this.questionIndex, this.scores, this.answers, this.scoreAnswer);

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Divider(
          height: 20,
          color: Colors.green,
        ),
        for (var i = 0; i < answers.length; i++)
          RadioListTile(
            value: i,
            // groupValue: 0,
            groupValue: scores.getSelectedOption(questionIndex),
            title: Text(
              answers[i]['text'].toString().toUpperCase(),
              style: TextStyle(color: Colors.purple, fontSize: 20.0),
            ),
            subtitle: Text(
              answers[i]['text'].toString().toUpperCase(),
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
            onChanged: i == 5
                ? null
                : (int value) {
                    scoreAnswer(questionIndex, value, answers[value]['score']);
                  },
            activeColor: Colors.red,
            secondary: IconButton(
              icon: Icon(Icons.help_rounded),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: answers[i]['text'],
                        descriptions: answers[i]['desc'],
                        text: "Close",
                      );
                    });
              },
            ),
            selected: false,
          ),
        Divider(
          height: 20,
          color: Colors.green,
        ),
      ],
    );
  }
}
