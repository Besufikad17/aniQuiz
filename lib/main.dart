import 'package:flutter/material.dart';

// custom widgets
import './home.dart';
import './result.dart';
import './quiz.dart';
import './utils.dart';

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
    },
    {
      "question": "Which one of the following is the oldest Aot character ?",
      "choices": [
        "Eren Jeager",
        "Bertholdt Hoover",
        "Annie Leonhart",
        "Marco Bodt"
      ],
      "answer": 2
    },
    {
      "question": "What's the time skip between Naruto and Naruto Shippuden ?",
      "choices": [
        "2 and half year",
        "3 years",
        "3 and half year",
        "5 years"
      ],
      "answer": 1
    },
    {
      "question": "What's the opening song of tokyo ghoul season 1 ?",
      "choices": [
        "99",
        "Haruka Kanata",
        "Eve",
        "Unravel"
      ],
      "answer": 4
    },
    {
      "question": "Which anime studio produces One Punch Man season 1 ?",
      "choices": [
        "Mappa",
        "A1 pictures",
        "Mad house",
        "Trigger"
      ],
      "answer": 3
    },
    {
      "question": "What's the name of the main character in No game No life ?",
      "choices": [
        "Sora",
        "Nakahara",
        "Tomozaki",
        "Ayanakoji"
      ],
      "answer": 1
    },
    {
      "question": "What's the longest One piece story arc next to Wano Country arc ?",
      "choices": [
        "Albasta arc",
        "Dressrosa Arc",
        "Whole Cake Island Arc",
        "Punk Hazard Arc"
      ],
      "answer": 2
    },
    {
      "question": "What's the most popular ecchi anime ?",
      "choices": [
        "No Game No Life",
        "Food wars",
        "Highschool dxd",
        "Prison School"
      ],
      "answer": 1
    },
    {
      "question": "Which pair of anime aired at the same season ?",
      "choices": [
        "Durara and Death note",
        "Jujutsu kaisen and the great pretender",
        "Trigun and Neon Genesis Evangelion",
        "Spy x Family and Mushoku Tensei"
      ],
      "answer": 2
    }
  ];

  // var questions = readJsonFile("assets/data.json");

  void _answer(bool isCorrect) async {

    setState(() {
      if(isCorrect){
        score++;
      }
      if (index <  questions.length - 1) {
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

  void _restart() {
    setState(() {
      index = 0;
      score = 0;
      finish = false;
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
          Result(score: score, callBackHandler: _restart,)
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
