import 'package:flutter/material.dart';
import 'package:flutter_assignment/text_output.dart';

import './text_output.dart';

class TextControl extends StatefulWidget {
  @override
  _TextControlState createState() => _TextControlState();
}

class _TextControlState extends State<TextControl> {
  var _bodyText = 'Hello';
  void _changeText() {
    setState(() {
      _bodyText = 'World';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextOutput(_bodyText),
        RaisedButton(
          child: Text('click to change text'),
          onPressed: _changeText,
        ),
      ],
    );
  }
}
