import 'package:flutter/material.dart';


class Result extends StatelessWidget {
  final int score;

  const Result({required this.score});

  String _getImg(int score, List<String> imgs) {
    if((score >= 0) && (score <= 2)){
      return imgs[0];
    } else if((score >= 3) && (score <= 5) ){
      return imgs[1];
    }else if((score >= 6) & (score <= 7)){
      return imgs[2];
    }else{
      return imgs[score - 5];
    }
  }

  @override
  Widget build(BuildContext context) {

    const List<String> imgs = [
      'assets/images/0-2.gif',
      'assets/images/3-5.gif',
      'assets/images/5-7.gif',
      'assets/images/8.png',
      'assets/images/9.png',
      'assets/images/10.png'
    ];

    return Container(
        margin: EdgeInsets.all(25),
        child: Center(
        child: Column(children: [
            Image.asset(
              _getImg(score, imgs),
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(score.toString() + "/10" , style: TextStyle(fontSize: 24),),
          ]),
        )
    );
  }
}
