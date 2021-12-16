import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // const Answer({ Key? key }) : super(key: key);

  // final Function? selectHandler;
  // Answer({this.selectHandler});

  final Function selectHandler;
  final String text;

  Answer(this.selectHandler, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(20),
      // ignore: deprecated_member_use
      child: RaisedButton(
        // textColor: Colors.white,
        child: Text(text),
        onPressed: () => selectHandler(),
      ),
    );
  }
}
