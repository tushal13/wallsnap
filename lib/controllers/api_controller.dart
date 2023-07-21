import 'package:flutter/material.dart';
import 'package:wallsnap/controllers/helpers/api_helper.dart';

class Apicontroller extends ChangeNotifier {
  List data = [];
  List WallSnap = [];
  List PopularWallSnap = [];
  List FeaturedWallSnap = [];
  List RandomWallSnap = [];
  Apicontroller() {
    Search();
  }

  Search({String val = "nature"}) async {
    data = await ApiHelper.apiHelper.getWallpapers(query: val) ?? [];
    notifyListeners();
    return 0;
  }

  wallsnap({String val = "wallpaper"}) async {
    WallSnap = await ApiHelper.apiHelper.getWallpapers(
          query: val,
        ) ??
        [];
    notifyListeners();
    return 0;
  }

  Popularwallsnap({
    String val = "wallpaper",
    String order = "all",
    orientation = 'all',
  }) async {
    PopularWallSnap = await ApiHelper.apiHelper.getWallpapers(
          query: val,
          order: order,
        ) ??
        [];
    notifyListeners();
    return 0;
  }

  Featuredwallsnap(
      {String val = "abstract",
      String order = "all",
      orientation = 'all'}) async {
    FeaturedWallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val, order: order, orientation: orientation) ??
        [];
    notifyListeners();
    return 0;
  }

  Randomwallsnap(
      {String val = "abstract",
      String order = "all",
      orientation = 'all'}) async {
    RandomWallSnap = await ApiHelper.apiHelper.getWallpapers(
            query: val, order: order, orientation: orientation) ??
        [];
    notifyListeners();
    return 0;
  }

  Favourite() {}
}
