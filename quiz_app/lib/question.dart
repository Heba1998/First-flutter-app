import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // const Question({ Key? key }) : super(key: key);
  var questionList;

  Question(this.questionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      child: Text(
        questionList as String,
        style: const TextStyle(fontSize: 20, color: Colors.blue),
        textAlign: TextAlign.center,
      ),
    );
  }
}
