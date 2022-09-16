import 'package:flutter/material.dart';

class NavigationController extends ChangeNotifier{
  String screenName = '/';

  void changScreen(String newScreenName){
    screenName = newScreenName;
    notifyListeners();
  }
}