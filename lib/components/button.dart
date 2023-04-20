import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Button extends StatelessWidget {
  final VoidCallback? callBackHandler;
  final String text;

  Button({this.callBackHandler, required this.text});

  ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(52, 209, 191, 1));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        child: Text(text),
        style: style,
        onPressed: callBackHandler,
      ),
    );
  }
}
