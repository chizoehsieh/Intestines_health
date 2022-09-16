import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test1/calendar/activity_controller.dart';
import 'package:test1/calendar/Activity.dart';
import 'package:test1/calendar/date.dart';

class home_data with ChangeNotifier{
  late Map<String,dynamic> data;
  late FirebaseAuth auth;

  getHomeData(String year,String month) async {
    auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if(user != null){
      print('http://203.145.206.20:5000'+'/calendar/'+user.uid+'/'+year+'/'+month);
      var response = await http.get(Uri.parse('http://203.145.206.20:5000'+'/calendar/'+user.uid+'/'+year+'/'+month));
      data = json.decode(response.body);
      for (int day = 1;day<=getDaysInMonth(int.parse(year), int.parse(month));day++){
        ActivityController.delete(ActivityController.readAt(day, int.parse(month), int.parse(year)));


      }

      if(data['data'] != []){
        for(int i=0;i<data['data'].length;i++){
          ActivityController.create(
              Activity(
                  day: int.parse(data['data'][i]['time'].split('-')[0].split('/')[2]),
                  month: int.parse(data['data'][i]['time'].split('-')[0].split('/')[1]),
                  year: int.parse(data['data'][i]['time'].split('-')[0].split('/')[0]),
                  objid: data['data'][i]['_id'],
                  imgid: data['data'][i]['imgID'],
                  healthId: data['data'][i]['calendarColor']
              )
          );
        }
      }

    }
  }
}