import 'package:flutter/material.dart';

// custom widgets
import './home.dart';

void main() => runApp(AniQuiz());

class AniQuiz extends StatefulWidget {
  const AniQuiz({super.key});

  @override
  State<AniQuiz> createState() => _AniQuizState();
}

class _AniQuizState extends State<AniQuiz> {
  var start = false;
  var finish = false;
  var index = 0;

  var questions = [
    {
      'text': 'terms and policies',
      'buttonText': ['accept']
    },
  ];

  void _answer() {
    setState(() {
      if (index < questions.length) {
        index++;
      } else {
        finish = true;
      }
    });
  }

  void _start() {
    setState(() {
      start = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('AniQuiz')),
        body: start
            ? (Center(
                child: Text('Home'),
              ))
            : (Home(
                callBackHandler: _start,
              )),
      ),
    );
  }
}
// background - 34D1BF
// foreground - 070707
