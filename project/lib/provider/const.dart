import 'dart:convert';

import 'package:flutter/cupertino.dart';

class constData with ChangeNotifier{
  var sex = null;
  var name = null;
  var age = null;
  var height = null;
  var weight = null;

  writeSex(String s){
    sex = s;
    print('sex'+sex);
    notifyListeners();
  }
}