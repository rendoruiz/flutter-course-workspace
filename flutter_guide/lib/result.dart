import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;

  Result(this.resultScore);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 70) {
      resultText = 'awesome';
    } else if (resultScore >= 50) {
      resultText = 'pretty cool';
    } else if (resultScore >= 30) {
      resultText = 'good';
    } else {
      resultText = 'meh';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
