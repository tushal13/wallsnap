// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class IntroScreenController extends ChangeNotifier {
//   SharedPreferences? prefs;
//
//   bool _isUserNew = false;
//   bool get isUserNew => _isUserNew;
//
//   Future<void> loadIntroScreen() async {
//     prefs = await SharedPreferences.getInstance();
//     _isUserNew = prefs!.getBool('userNew') ?? false;
//     notifyListeners();
//   }
//
//   Future<void> markIntroScreenAsShown() async {
//     await prefs!.setBool('userNew', true);
//     _isUserNew = true;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroScreenController extends ChangeNotifier {
  bool isIntro = false;

  IntroScreenController({required this.isIntro});

  void isShow() async {
    isIntro = true;

    SharedPreferences Pref = await SharedPreferences.getInstance();

    Pref.setBool("isIntro", isIntro);

    notifyListeners();
  }
}
