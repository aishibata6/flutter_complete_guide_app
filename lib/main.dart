import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

    final _questions = const [
      {
        'questionText' : 'What\'s your favorite color?', 
        'answers' : 
        [{'text': 'Black', 'score': 10}, {'text': 'Red', 'score': 5}, {'text': 'Purple', 'score': 20}, {'text': 'White', 'score': 2}],
        },
      {
        'questionText' : 'What\'s your favorite animal?', 
        'answers' : [{'text': 'Rabbit', 'score': 3}, {'text': 'Monkey', 'score': 10}, {'text': 'Lion', 'score': 10}, {'text': 'Elephant', 'score': 15}],
        },
      {
        'questionText' : 'What\'s your plan for NYE?', 
        'answers' : [{'text' : 'Stay home', 'score': 5}, {'text':'Go out', 'score': 19}, {'text':'Drink away', 'score': 10}, {'text':'Don\'t know yet', 'score': 1}],
        },
    ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    // setState is a trigger that informs flutter to re-run build() of the Widget. 
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
          print('We have more questions!'); 
      } else {
        print('No more questions');
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ai\'s Personality Quiz'),
        ),
         body: _questionIndex < _questions.length ? 
         Quiz(
            answerQuestion: _answerQuestion, 
            questionIndex: _questionIndex, 
            questions: _questions)
          : 
         Result(_totalScore, _resetQuiz),
        ),
      );
  }
}
