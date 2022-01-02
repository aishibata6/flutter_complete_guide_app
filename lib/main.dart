import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

    final questions = const [
      {
        'questionText' : 'What\'s your favorite color?', 
        'answers' : ['black', 'red', 'purple', 'white'],
        },
      {
        'questionText' : 'What\'s your favorite animal?', 
        'answers' : ['rabbit', 'snake', 'lion'],
        },
      {
        'questionText' : 'What\'s your plan for NYE?', 
        'answers' : ['Stay home', 'Go out', 'Drink away', 'Don\'t know yet'],
        },
    ];

  var _questionIndex = 0;

  void _answerQuestion() {
    // setState is a trigger that informs flutter to re-run build() of the Widget. 
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < questions.length) {
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
          title: Text('Ai\'s AI Quiz'),
        ),
         body: _questionIndex < questions.length ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<String>)
            .map((answer) {
              return Answer(_answerQuestion, answer);
            }
            ).toList()
          ],
        ) : Center(child: Text('You did it!'),
        ),
      ),
    );
  }
}
