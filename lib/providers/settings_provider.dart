import 'package:flutter/material.dart';

class SettingsProvider extends ChangeNotifier{
  int _visibility=100;

  int get visibility => _visibility;

  set visibility(int value) {
    _visibility = value;
    notifyListeners();
  }
}