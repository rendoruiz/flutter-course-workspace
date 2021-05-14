import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

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
      'question': 'fav color?',
      'answers': [
        {'text': 'black', 'score': 5},
        {'text': 'red', 'score': 15},
        {'text': 'yellow', 'score': 25},
        {'text': 'green', 'score': 35}
      ]
    },
    {
      'question': 'fav animal?',
      'answers': [
        {'text': 'doggo', 'score': 5},
        {'text': 'kot', 'score': 15},
        {'text': 'u', 'score': 25},
        {'text': 'lyon', 'score': 35}
      ]
    },
    {
      'question': 'fav weather?',
      'answers': [
        {'text': 'cloudy', 'score': 5},
        {'text': 'sunny', 'score': 15},
        {'text': 'rainy', 'score': 25},
        {'text': 'snowy', 'score': 35}
      ]
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < _questions.length) {
      print('more questions available');
    } else {
      print('no questions available');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('This is a title'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions,
            )
          : Result(_totalScore),
    ));
  }
}
