import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class ConnectivityController extends ChangeNotifier {
  Connectivity isconnected = Connectivity();
  bool hasInternetConnection = false;

  isConnectivity() {
    hasInternetConnection = true;
    notifyListeners();
    return hasInternetConnection;
  }

  noConnectivity() {
    hasInternetConnection = false;
    notifyListeners();
    return hasInternetConnection;
  }
}
