import '../Constants.dart';

class Answer {
  final int _score;
  final int _optionSelected;

  Answer(this._score, this._optionSelected);
}

class Scores {
  Map<int, Answer> _scores = Map();

  Scores();

  static Scores init() {
    Scores _scores = Scores();

    for (var i = 0; i < QUESTIONS.length; i++) {
      Map<String, Object> ans = (QUESTIONS[i]['answers'] as List).elementAt(0);
      _scores.setScore(i, Answer(ans['score'], 0));
    }
    return _scores;
  }

  void setScore(int questionIndex, Answer answer) {
    _scores[questionIndex] = answer;
  }

  int getTotalScore() {
    int _total = 0;
    _scores.forEach((k, v) => _total += v._score);
    return _total;
  }

  int getScore(int question) {
    return _scores[question]._score;
  }

  int getSelectedOption(int question) {
    return _scores[question]._optionSelected;
  }
}
