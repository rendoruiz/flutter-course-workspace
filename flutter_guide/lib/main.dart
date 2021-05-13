import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  var questionIndex = 0;

  void answerQuestion() {
    questionIndex += 1;
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      'fav color?',
      'fav animar?',
    ];
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('This is a title'),
      ),
      body: Column(
        children: [
          Text(questions[questionIndex]),
          RaisedButton(
            child: Text('Answer 1'),
            onPressed: () => print('answer 1'),
          ),
          RaisedButton(
            child: Text('Answer 2'),
            onPressed: () => print('answer 2'),
          ),
          RaisedButton(
            child: Text('Answer 3'),
            onPressed: () => print('answer 3'),
          ),
        ],
      ),
    ));
  }
}
