import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

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
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'question': 'fav color?',
        'answers': ['black', 'red', 'yellow', 'green']
      },
      {
        'question': 'fav animal?',
        'answers': ['doggo', 'kot', 'u', 'lyon']
      },
      {
        'question': 'fav weather?',
        'answers': ['cloudy', 'sunny', 'rainy', 'snowy']
      },
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('This is a title'),
      ),
      body: Column(
        children: [
          Question(questions[_questionIndex]['question']),
          ...(questions[_questionIndex]['answers'] as List<String>)
              .map((answer) {
            return Answer(_answerQuestion, answer);
          }).toList()
        ],
      ),
    ));
  }
}
