import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:test1/calendar/Activity.dart';
import 'package:test1/calendar/style.dart' as s;
import 'package:test1/calendar/date.dart';
import 'package:test1/calendar/day.dart';
import 'package:test1/calendar/activity_controller.dart';

class Month extends StatefulWidget{
  final int month;
  final int year;
  final bool onPressed;
  final bool showMonthTitle;

  const Month({
    required this.month,
    required this.year,
    this.showMonthTitle = true,
    this.onPressed = false,
});

  @override
  _MonthState createState() => _MonthState();
}

class _MonthState  extends c.State<Month>{
  Activity? _getActivity(int day){
    return ActivityController.readAt(day,widget.month,widget.year);
  }
  Widget _daysGrid(BuildContext context){
    final int daysInMonth = getDaysInMonth(widget.year, widget.month);
    final int firstWeekDay = DateTime(widget.year,widget.month,1).weekday;
    final daysList = <Widget>[];
    var week = ['一','二','三','四','五','六','日'];
    for(int i=0;i<7;i++){
      daysList.add(Center(child: Text(week[i],style: TextStyle(fontSize: 18,color: Color(0XFF000000)),),));
    }
    for (int day = 2-firstWeekDay;day<=daysInMonth;day++){
      if(day <= 0){
        daysList.add(const Day());
      }else{
        daysList.add(Day(
            activity: _getActivity(day),
            onPressed: (widget.onPressed == false),
          )
        );
      }
    }
    return GridView.count(
      primary: false,
      shrinkWrap: true,
      crossAxisCount: 7,
      children: daysList,
    );
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ValueListenableBuilder(
      valueListenable: Hive.box<Activity>(activityBoxName).listenable(),
      builder: (context,Box<Activity> box,_){
        return LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints){
              final double _size = constraints.maxWidth;
              return c.CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: (widget.onPressed)?(){
                  print('home');
                }:null,
                child: Column(
                  children: [
                    if(widget.showMonthTitle)
                      MonthTitle(
                        month: widget.month,
                        year: widget.year,
                        size: _size,
                      ),

                    _daysGrid(context),
                  ],
                ),
              );
            },
        );
      },
    );
  }
}
class MonthTitle extends StatelessWidget{
  int month;
  int year;
  double size;
  String _getYear;

  static const int _thresh = 200;
  MonthTitle({
    required this.month,
    required this.year,
    required this.size,
}) :assert(size <= _thresh || (size > _thresh && year != null)),
  _getYear = (size < _thresh) ? '' : year.toString();

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.fromLTRB(14, 10, 0, 10),
      child: Text(
        getMonthTitle(month) +'  '+ _getYear,
        style: (size < _thresh)
          ? s.Style.footerNoteSecondary(context)
          : s.Style.largeTitle(context),
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
