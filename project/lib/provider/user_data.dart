import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class user_data with ChangeNotifier{
  // String userData = "";
  String name = "",age = "",sex = "", height = "",weight = "",deviceName = "";
  var birth;
  int count = 0;
  int change = 1;
  int state = 0;
  late FirebaseAuth auth;
  // user_data({required this.name,required this.age,required this.sex,required this.height,required this.weight});

  getUserData() async {
    print("change:" + change.toString());
    print("count:" + count.toString());
    count += 1;
    auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if(user != null){
      // print(user.uid);
      var response = await http.get(Uri.parse('http://203.145.206.20:5000' + '/member/'+user.uid));
      print(response.body);
      var body = json.decode(response.body);
      print(body.runtimeType);
      if(change == 1 && (body['status'] == 1))
      {
        print("cccccc");
        change == 0;
        name = body['name'];
        birth = DateFormat('yyyy/MM/dd').parse(body['birth']);
        sex = body['sex'];
        height = body['height'];
        weight = body['weight'];
        deviceName = body['camID'];
        state = body['status'];
      }
      else if(body['status'] == 0 || body['status'] == null || body == null){
        state = body['status'];
      }

      // name = "n";
      // age = "a";
      // sex = "s";
      // height = "h";
      // weight = "w";
      notifyListeners();
    }
  }

  // factory user_data.fromJson(Map<String,dynamic> body){
  //   return user_data(
  //       name : body['name'],
  //       age : body['age'],
  //       sex : body['sex'],
  //   height : body['height'],
  //   weight : body['weight'],
  //   );
  // }
}