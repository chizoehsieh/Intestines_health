import 'package:hive/hive.dart';
import 'package:test1/calendar/id.dart';

import 'Activity.dart';
import 'date.dart';
import 'id.dart';

class ActivityController{
  static final ActivityController _activityControllerSingleton = ActivityController._internal();
  ActivityController._internal();
  factory ActivityController() => _activityControllerSingleton;

  static Future<void> create(Activity activity) async {
    print(Hive.box<Activity>(activityBoxName).length);
    final String id = Id(activity.day, activity.month, activity.year).toString();
    return Hive.box<Activity>(activityBoxName).put(id, activity);
  }

  static Map<String,Activity> readAll(){
    return Hive.box<Activity>(activityBoxName).toMap().map((id, activity) => MapEntry(id as String,activity));
  }

  static Activity? readAt(int day,int month,int year){
    String id = Id(day,month,year).toString();
    return Hive.box<Activity>(activityBoxName).get(
        id,
      defaultValue: Activity(objid: '', day: day, month: month, year: year, health: 0, healthId: 3, imgid: ''),
    );
  }
  
  static Map<String,Activity> readRange(DateTime start,DateTime end){
   return Map<String,Activity>.fromEntries(
       readAll().entries.where((element) => 
           Id.from(element.key).toDateTime().isAtSameMomentAs(start) ||
           Id.from(element.key).toDateTime().isAtSameMomentAs(end) ||
               (Id.from(element.key).toDateTime().isAfter(start) && Id.from(element.key).toDateTime().isBefore(end)),
       ),
   );
  }

  static int rangeLength(DateTime start,DateTime end){
    return readRange(start, end).length;
  }

  static Future<void> delete(Activity? activity) async{
    if(activity != null){
      final String id = Id(activity.day,activity.month,activity.year).toString();
      await Hive.box<Activity>(activityBoxName).delete(id);
    }

  }

}