import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/result.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What is your favourite color?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Blue', 'score': 5},
        {'text': 'Black', 'score': 3},
        {'text': 'Green', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s favourite animal?',
      'answers': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cow', 'score': 5},
        {'text': 'Turtle', 'score': 3},
        {'text': 'Cat', 'score': 1},
      ]
    },
    {
      'questionText': 'What\'s favourite food?',
      'answers': [
        {'text': 'Pizza', 'score': 10},
        {'text': 'Hamburger', 'score': 5},
        {'text': 'Caviar', 'score': 3},
        {'text': 'Sushi', 'score': 1},
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(
      () {
        _questionIndex = 0;
        _totalScore = 0;
      },
    );
  }

  void _answerQuestion(int score) {
    //_totalScore = _totalScore + score; is long version for shortcut below
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
