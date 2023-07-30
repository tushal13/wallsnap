import 'package:flutter/material.dart';
import 'helpers/api_helper.dart';

class Apicontroller extends ChangeNotifier {
  late bool isDark;
  late bool issafesearch;
  late bool iseditorschoice;
  String selectedSegment = 'all';
  String selectedOption = 'lockscreen';
  List data = [];
  List WallSnap = [];
  List PopularWallSnap = [];
  List FeaturedWallSnap = [];
  List RandomWallSnap = [];

  Apicontroller() {
    isDark = false;
    issafesearch = false;
    iseditorschoice = false;
    Search();
    wallsnap();
    Popularwallsnap();
    Featuredwallsnap();
    Randomwallsnap();
  }

  setSelectedOption(String option) {
    selectedOption = option;
    notifyListeners();
  }

  setSelectedSegment(String value) {
    selectedSegment = value;
    notifyListeners();
  }

  setisDark(bool val) {
    isDark = val;
    notifyListeners();
  }

  setissafesearch(bool val) {
    issafesearch = val;
    notifyListeners();
  }

  setiseditorschoice(bool val) {
    iseditorschoice = val;
    notifyListeners();
  }

  Search({
    String val = "nature",
    String type = "all",
  }) async {
    data = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            safesearch: issafesearch,
            editorschoice: iseditorschoice,
            image_type: type) ??
        [];
    notifyListeners();
    return 0;
  }

  wallsnap({String val = "animals", String type = "all"}) async {
    WallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            image_type: type,
            safesearch: issafesearch,
            editorschoice: iseditorschoice) ??
        [];
    notifyListeners();
    return 0;
  }

  Popularwallsnap(
      {String val = "popular",
      String order = "all",
      orientation = 'all',
      String type = "all"}) async {
    PopularWallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            order: order,
            safesearch: issafesearch,
            editorschoice: iseditorschoice) ??
        [];
    notifyListeners();
    return 0;
  }

  Featuredwallsnap(
      {String val = "Quotes",
      String order = "all",
      orientation = 'all',
      String type = "all"}) async {
    FeaturedWallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            order: order,
            orientation: orientation,
            safesearch: issafesearch,
            editorschoice: iseditorschoice) ??
        [];
    notifyListeners();
    return 0;
  }

  Randomwallsnap(
      {String val = "Random wallpaper",
      String order = "all",
      orientation = 'all',
      String type = "all"}) async {
    RandomWallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            order: order,
            orientation: orientation,
            safesearch: issafesearch,
            editorschoice: iseditorschoice) ??
        [];
    notifyListeners();
    return 0;
  }
}
