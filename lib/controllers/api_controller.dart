import 'package:flutter/material.dart';

import 'helpers/api_helper.dart';

class Apicontroller extends ChangeNotifier {

  late bool isDark;
  late bool issafesearch;
  late bool iseditorschoice;
  String selectedSegment = 'all';
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
    print("value:$val");
    notifyListeners();
  }

  Search({String val = "nature", String type = "all"}) async {
    data = await ApiHelper.apiHelper.getWallpapers(
            query: val,
            safesearch: issafesearch,
            editorschoice: iseditorschoice) ??
        [];
    notifyListeners();
    return 0;
  }

  wallsnap({String val = "religion", String type = "all"}) async {
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
      {String val = "wallpaper",
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
      {String val = "roses",
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
      {String val = "abstract",
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
