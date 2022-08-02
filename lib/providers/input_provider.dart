import 'package:flutter/material.dart';

class InputProvider extends ChangeNotifier{
  int _firstSelected=-1;

  int get firstSelected => _firstSelected;

  set firstSelected(int value) {
    _firstSelected = value;
    notifyListeners();
  }

}