import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final Map questionAndAnswer;

  Quiz(this.answerQuestion, this.questionAndAnswer);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionAndAnswer['questionText'],
        ),
        ...(questionAndAnswer['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        }).toList()
      ],
    );
  }
}
