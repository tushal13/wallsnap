import 'package:flutter/material.dart';

class WallController extends ChangeNotifier {
  int selectedRadioValue = 1;

  setSelectedRadioValue(int value) {
    selectedRadioValue = value;
    notifyListeners();
  }
}
