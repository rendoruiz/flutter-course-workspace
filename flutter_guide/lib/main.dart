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
  final questions = const [
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

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);

    if (_questionIndex < questions.length) {
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
      body: _questionIndex < questions.length
          ? Column(
              children: [
                Question(questions[_questionIndex]['question']),
                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((answer) {
                  return Answer(_answerQuestion, answer);
                }).toList()
              ],
            )
          : Center(
              child: Text('You did it'),
            ),
    ));
  }
}
