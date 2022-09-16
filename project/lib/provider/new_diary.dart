import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class new_diary with ChangeNotifier{
  String response = "";

  new_diary(String sendTime, String ps, path, String uid);

  postDiary(String Time,String ps,String path,String uid) async {
    var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/data/'+uid));
    request.fields.addAll({
      'time' : Time,
      'ps' : ps
    });
    request.files.add(await http.MultipartFile.fromPath('stoolPic', path));
    print(path);
    http.StreamedResponse response = await request.send();
    print(response);
    }
  }
