import 'package:flutter/material.dart';

class TabTitleProvider extends ChangeNotifier {
  final List<String> tabTitles = [
    "Collections",
    "WallSnap",
    "Featured",
    "Popular",
    "Random",
  ];

  late String _currentTitle;
  late int _selectedIndex;

  TabTitleProvider() {
    _currentTitle = tabTitles[1];
    _selectedIndex = 1;
  }

  String get currentTitle => _currentTitle;
  int get selectedIndex => _selectedIndex;

  void updateTitleAndIndex(int newIndex) {
    _selectedIndex = newIndex;
    _currentTitle = tabTitles[newIndex];
    notifyListeners();
  }
}
