import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart' as words;
import 'package:flutter_application_2/wordle.dart';

class HurdleProvider extends ChangeNotifier {
  final random = Random.secure();
  List<String> totalWords = [];
  List<String> rowInputs = [];
  List<String> excludedLetters = [];
  List<Wordle> HurdleBoard = [];
  String targetWord = '';
  int count = 0;
  final letterPerRow = 5;
  int index = 0;
  bool wins = false;
  final totalAttempts = 6;
  int attempts = 0;

  bool get isAvalidWord =>
      totalWords.contains(rowInputs.join('').toLowerCase());

  bool get shouldCheckForAnswer => rowInputs.length == letterPerRow;

   bool get noAttemptsLeft => attempts == totalAttempts;
 

  init() {
    totalWords = words.all.where((element) => element.length == 5).toList();
    generateBoard();
    generateRandomWord();
  }

  generateBoard() {
    HurdleBoard = List.generate(30, (index) => Wordle(letter: ''));
  }

  generateRandomWord() {
    targetWord = totalWords[random.nextInt(totalWords.length)].toUpperCase();
    print(targetWord);
  }

  inputLetter(String letter) {
    if (count < letterPerRow) {
      count++;
      rowInputs.add(letter);
      HurdleBoard[index] = Wordle(letter: letter);
      index++;
      print(rowInputs);
      notifyListeners();
    }
  }

  void deleteLetter() {
    if (rowInputs.isNotEmpty) {
      rowInputs.removeAt(rowInputs.length - 1);
      notifyListeners();
    }
    if (count > 0) {
      HurdleBoard[index - 1] = Wordle(letter: '');
      count--;
      index--;
    }
    notifyListeners();
  }

  void checkAnswer() {
    final input = rowInputs.join('');
    if (targetWord == input) {
      wins = true;
    } else {
      _markLetterOnBoard();
      if(attempts <  totalAttempts){
        _gotoNextRow();
      }
    }
  }

  void _markLetterOnBoard() {
    for (int i = 0; i < HurdleBoard.length; i++) {
      if(HurdleBoard[i].letter.isNotEmpty && targetWord.contains(HurdleBoard[i].letter)){
        HurdleBoard[i].existInTarget = true;
      }else if(HurdleBoard[i].letter.isNotEmpty && !targetWord.contains(HurdleBoard[i].letter) ){
          HurdleBoard[i].doesNotExistInTarget = true;
          excludedLetters.add(HurdleBoard[i].letter);
      }
    }
    notifyListeners();
  }
  
  void _gotoNextRow() {
    attempts++;
    count = 0;
    rowInputs.clear();
  }

  reset(){
    count = 0;
    index = 0;
    rowInputs.clear();
    excludedLetters.clear();
    attempts = 0;
    notifyListeners();
  }
}
