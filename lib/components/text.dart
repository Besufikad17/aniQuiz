import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;

  MyText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(text,
          style: TextStyle(
            fontSize: 26,
          ),
          textAlign: TextAlign.center),
    );
  }
}
