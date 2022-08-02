import 'dart:math';

import 'package:flutter/material.dart';

enum Answer{
  none,
  correct,
  incorrect,
}
class ActiveProvider extends ChangeNotifier{

  static const List<String> _notes=["A", "E", "B", "F#", "C#", "Ab", "Eb", "Bb", "F", "C","G","D","F#m", "C#m", "Abm", "Ebm", "Bbm", "Fm", "Cm","Gm","Dm","Am", "Em", "Bm"];
  final Random _random=Random();
  late int _randomActive;
  bool feedbackListener=true; ///Bool that is used to trigger the feedback animation
  Answer answer=Answer.none;


  ActiveProvider(){
    _randomActive=_random.nextInt(24).toInt();
  }

  newActive(){
    _randomActive=_random.nextInt(24).toInt();
    notifyListeners();
  }

  submitAnswer(bool correct){
    if(correct){
      answer=Answer.correct;
      newActive();
    }
    else {
      answer = Answer.incorrect;
    }
    notifyFeedback();
  }

  notifyFeedback(){
    feedbackListener=!feedbackListener;
    notifyListeners();
  }


  List<String> get notes=>_notes;
  int get randomActive=>_randomActive;
}