import 'package:flutter/material.dart';
import 'package:flutter_application_2/wordle.dart';

class WordleView extends StatelessWidget {

  final Wordle wordle;

  const WordleView({super.key, required this.wordle});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape:  BoxShape.circle,
        color: wordle.existInTarget ?Colors.lightGreen.shade700 : wordle.doesNotExistInTarget 
          ?  Colors.white60 : null,
          border: Border.all(
            color: Colors.amber,
            width: 1.5
          )
      ),
      child: Text(wordle.letter, style: TextStyle(
        fontSize: 16,
        color: wordle.existInTarget ? Colors.black: 
          wordle.doesNotExistInTarget ? Colors.white54 : Colors.white
          )
      ),
    );
  }
}