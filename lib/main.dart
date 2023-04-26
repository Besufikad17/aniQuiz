import 'package:aniquiz/quiz.dart';
import 'package:flutter/material.dart';

// custom widgets
import './home.dart';
import './result.dart';

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
    },
    {
      "question": "Which of the following story arc is adopted in 1992 Hunter x Hunter anime?",
      "choices": [
        "Heavens Arena arc",
        "Chimra Ant arc",
        "Election arc",
        "None"
      ],
      "answer": 1
    }
  ];

  void _answer(bool isCorrect) {
    print(isCorrect);
    setState(() {
      if(isCorrect){
        score++;
      }
      if (index < questions.length - 1) {
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
          Result(score: score,)
        ) : (
            start
                ? (Center(
              child: Column(children: [
                Quiz(
                    question: questions [index]['question'] as String,
                    choice: questions[index]['choices'] as List<String>,
                    answer: questions[index]['answer'] as int,
                    callbackHandler: (bool i) => _answer(i)),
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
