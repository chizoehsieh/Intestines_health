import 'dart:io';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class old_diary with ChangeNotifier{
  List<String> diary_result = [];
  late FirebaseAuth auth;
  late List<dynamic> body;
  late DateTime startTime,endTime;
  late Map<String,dynamic> detail;
  var imgResponse;
  var imgid;
  List<chartData> data = [];

  getResult(DateTime start,DateTime end) async {
    startTime = start;
    endTime = end;
    print('getting....');
    auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    diary_result = [];
    if(user != null){
      var response = await http.get(Uri.parse('http://203.145.206.20:5000' + '/easyresult/'+user.uid+'/'+ DateFormat("yyyy/MM/dd").format(start)+'/'+DateFormat("yyyy/MM/dd").format(end)));
      body = json.decode(response.body).reversed.toList();
      data.clear();
      body.sort((a,b) => a['time'].compareTo(b['time']));
      body = List.from(body.reversed);
      for(int i=0;i<body.length;i++){
        data.add(chartData(DateFormat('yyyy/MM/dd').parse(body[i]['time'].split('-')[0]),body[i]['hscore'][0]));
      }
    }
    notifyListeners();
  }
 getDetail(String id,String imgID) async {
    imgid = imgID;
    var response = await http.get(Uri.parse('http://203.145.206.20:5000' + '/detail/'+ id));
    detail = json.decode(response.body);
    var response2 = await http.get(Uri.parse('http://203.145.206.20:5000' + '/picture/'+ imgID));
 }

}

class chartData{
  final DateTime time;
  final double hscore;
  chartData(this.time,this.hscore);
}

