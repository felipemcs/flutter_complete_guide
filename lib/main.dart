import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questions = const [
    {
      'questionText': 'Question 1?',
      'answers': [
        {'text': 'Answer 1 from question 1', 'score': 10},
        {'text': 'Answer 2 from question 1', 'score': 5},
        {'text': 'Answer 3 from question 1', 'score': 3},
      ],
    },
    {
      'questionText': 'Question 2?',
      'answers': [
        {'text': 'Answer 1 from question 2', 'score': 10},
        {'text': 'Answer 2 from question 2', 'score': 5},
        {'text': 'Answer 3 from question 2', 'score': 3},
        {'text': 'Answer 4 from question 2', 'score': 1},
      ],
    },
    {
      'questionText': 'Question 3?',
      'answers': [
        {'text': 'Answer 1 from question 3', 'score': 10},
        {'text': 'Answer 2 from question 3', 'score': 5},
        {'text': 'Answer 3 from question 3', 'score': 1},
      ],
    }
  ];

  void _resetQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
