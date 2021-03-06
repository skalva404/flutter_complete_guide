import 'package:flutter/material.dart';

import 'Questions.dart';
import 'RadioAnswer.dart';
import 'Answer.dart';
import '../model/Scores.dart';

class QnA extends StatelessWidget {
  final Scores scores;
  final Object answers;
  final String question;
  final int questionIndex;
  final Function scoreAnswer;
  final Function moveToNextQuestion;

  static int _index = 0;

  QnA(this.scores, this.question, this.answers, this.scoreAnswer,
      this.moveToNextQuestion, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Question(question),
          RadioAnswer(questionIndex, scores, answers, scoreAnswer),
          // ...(answers as List<Map<String, Object>>).map((answer) {
          //   return Answer(
          //       answer['text'], () => answerQuestion(answer['score']));
          // }).toList(),
          Padding(
            padding: const EdgeInsets.fromLTRB(75.0, 15.0, 1.0, 1.0),
            child: Stepper(
              type: StepperType.vertical,
              currentStep: questionIndex,
              onStepCancel: () {
                _index = --_index < 0 ? 0 : _index;
                moveToNextQuestion(_index);
              },
              onStepContinue: () {
                _index++;
                moveToNextQuestion(_index);
                if (_index > 2) {
                  _index = 0;
                }
              },
              onStepTapped: (index) {
                _index = index;
                moveToNextQuestion(_index);
              },
              steps: [
                Step(
                  title: Text(
                    "Color",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I want to try Color Quiz",
                        style: TextStyle(fontSize: 15, color: Colors.indigo),
                      )),
                ),
                Step(
                  title: Text(
                    "Animal",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I want to try Animal Quiz",
                        style: TextStyle(fontSize: 15, color: Colors.indigo),
                      )),
                ),
                Step(
                  title: Text(
                    "Dish",
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                  content: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "I want to try Dish Quiz",
                        style: TextStyle(fontSize: 15, color: Colors.indigo),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
