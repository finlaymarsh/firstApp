import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetQuiz;

  Result(this.resultScore, this.resetQuiz);

  String get resultPhase {
    var resultText = 'You did it!';
    if (resultScore == 0) {
      resultText = 'Rubbish attempt...';
    } else if (resultScore == 1) {
      resultText = 'Poor attempt.';
    } else if (resultScore == 2) {
      resultText = 'Good attempt.';
    } else if (resultScore == 3) {
      resultText = 'Spectacular attempt!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          OutlinedButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz'),
            style: OutlinedButton.styleFrom(
              textStyle: TextStyle(color: Colors.blue),
              side: BorderSide(color: Colors.blue),
            ),
          )
        ],
      ),
    );
  }
}
