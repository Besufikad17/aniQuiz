import 'package:aniquiz/quiz.dart';
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
  var score = 0;

  var questions = [
    {
      "question": "Who is the author of vinland saga?",
      "choices": [
        "Yuki Tabata",
        "Kentero Mirua",
        "Makoto Yukimura",
        "Takhiko Inoue"
      ],
      "answer": 3
    }
  ];

  void _answer(bool isCorrect) {
    print(isCorrect);
    setState(() {
      if(isCorrect){
        score++;
      }
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
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(52, 209, 191, 1),
            title: Text('AniQuiz')),
        body: finish ? (
        Center(
          child: Text(score.toString()),
        )
        ) : (
            start
                ? (Center(
              child: Column(children: [
                ...((questions as List<Map>).map((q) => Quiz(
                    question: q['question'],
                    choice: q['choices'],
                    answer: q['answer'],
                    callbackHandler: (bool i) => _answer(i)))).toList(),
              ]),
            ))
                : (Home(
              callBackHandler: _start,
            ))
        ),
      ),
    );
  }
}
// background - 34D1BF
// foreground - 070707
