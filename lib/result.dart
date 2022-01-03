import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  // passing the value from 
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

// getter? 
  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange but fun';
    } else {
      resultText = 'You are a very interesting person!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            'Total Score: ',
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Text(
            resultScore.toString(),
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.amber),
          ),
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            style: TextButton.styleFrom(
              primary: Colors.indigo[900],
            ),
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}