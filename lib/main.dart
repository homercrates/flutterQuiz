import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
import './impListQs.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const _questions = [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'grey', 'score': 5},
        {'text': 'purple', 'score': 2},
        {'text': 'red', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'bat', 'score': 10},
        {'text': 'rat', 'score': 5},
        {'text': 'cat', 'score': 2},
        {'text': 'sat', 'score': 1}
      ],
    },
    {
      'questionText': 'what\'s your favorite co?',
      'answers': [
        {'text': 'do', 'score': 1},
        {'text': 'doo', 'score': 2},
        {'text': 'dooo', 'score': 3},
        {'text': 'doooo', 'score': 4}
      ],
    },
    {
      'questionText': 'what\'s your favorite colo?',
      'answers': [
        {'text': 'one', 'score': 1},
        {'text': 'two', 'score': 2},
        {'text': 'thr', 'score': 3},
        {'text': 'four', 'score': 4},
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;
    print(_totalScore);

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('My First Flutt'),
          ),
          body: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                )
              : Result(_totalScore, _resetQuiz)),
    );
  }
}
