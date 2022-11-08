import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final void Function(int) answerQuestion;
  final List<Map<String, Object>> questions;
  final int questionIndex;
  const Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.questionIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questions[questionIndex]['questionText'] as String),
        ...(questions[questionIndex]['answers']! as List<Map<String, Object>>)
            .map((answer) => Answer(() => answerQuestion(answer['score'] as int), answer['text'] as String))
            .toList(),
      ],
    );
  }
}
