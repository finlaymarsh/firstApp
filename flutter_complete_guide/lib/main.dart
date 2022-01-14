import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp()); // short hand for single expression functions

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  // Every Widget has a build method
  @override
  Widget build(BuildContext context) {
    const _questions = [
      {
        'questionText': 'What\'s your favourite colour?',
        'answers': [
          {'score': 1, 'text': 'Black'},
          {'score': 0, 'text': 'Red'},
          {'score': 0, 'text': 'Green'},
          {'score': 0, 'text': 'White'}
        ]
      },
      {
        'questionText': 'What\'s your favourite animal?',
        'answers': [
          {'score': 0, 'text': 'Rabbit'},
          {'score': 0, 'text': 'Snake'},
          {'score': 0, 'text': 'Elephant'},
          {'score': 1, 'text': 'Lion'}
        ]
      },
      {
        'questionText': 'What\'s the best programming language?',
        'answers': [
          {'score': 0, 'text': 'Python'},
          {'score': 0, 'text': 'Java'},
          {'score': 1, 'text': 'Dart'},
          {'score': 0, 'text': 'Javascript'}
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
          centerTitle: true,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_answerQuestion, _questions[_questionIndex])
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }
}
