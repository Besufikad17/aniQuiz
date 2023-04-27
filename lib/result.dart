import 'package:flutter/material.dart';

// custom widget
import 'components/button.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback callBackHandler;

  const Result({required this.score, required this.callBackHandler});


  @override
  Widget build(BuildContext context) {

    const List<String> imgs = [
      'assets/images/0-2.gif',
      'assets/images/0-2.gif',
      'assets/images/0-2.gif',
      'assets/images/3-5.gif',
      'assets/images/3-5.gif',
      'assets/images/3-5.gif',
      'assets/images/5-7.gif',
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
              imgs[score],
              height: 200,
              width: 200,
            ),
            SizedBox(height: 20),
            Text(score.toString() + "/10" , style: TextStyle(fontSize: 24),),
          Button(
            text: 'Retry',
            callBackHandler: callBackHandler,
          ),
          SizedBox(height: 200),
          Text('v0.0.1')
          ]),
        )
    );
  }
}
