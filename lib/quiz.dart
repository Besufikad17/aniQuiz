import 'package:flutter/material.dart';
import 'dart:convert';

// utility
import 'utils.dart';

// custom widgets
import 'components/text.dart';

class Quiz extends StatelessWidget {
  final String question;
  final List<String> choice;
  final int? answer;
  final Function callbackHandler;

  Quiz({required this.question, required this.choice, required this.answer, required this.callbackHandler});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        MyText(text: question),
        ...(choice.map((ch) {
          return RadioListTile(
              title: Text(ch),
              value: ch,
              groupValue: "choices",
              onChanged: (value) {
                if(choice.indexOf(value!) == (answer! - 1)){
                  callbackHandler(true);
                }else{
                  callbackHandler(false);
                }
              });
        }))
      ]),
    );
  }
}
