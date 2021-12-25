 import 'package:flutter/material.dart';
 
 // main function runs automatically when the file is parced. 
//  void main() {
//    // from material.dart file
//    runApp(MyApp());
//  }

 void main() => runApp(MyApp());
 
  // need to extend either stateless or state widget 
 class MyApp extends StatelessWidget {
   // @override decorator; makes the code cleaner; 
   @override 
    Widget build(BuildContext context) {
      var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?'
      ];
        return MaterialApp(home: Scaffold(
          appBar: AppBar(title: Text('My first app'),),
          body: Column(children: [
            Text('The question!'), 
            RaisedButton(child: Text('Answer 1'), onPressed: null),
            RaisedButton(child: Text('Answer 1'), onPressed: null),
            RaisedButton(child: Text('Answer 1'), onPressed: null),

          ],),
        ),
        ); 
    }
 }