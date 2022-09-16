import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

bool isCurrentDate(int year,int month,int day){
  DateTime date = new DateTime(year,month,day);
  final DateTime now = DateTime.now();
  return date.isAtSameMomentAs(DateTime(now.year,now.month,now.day));
}

bool isBeforeCurrentDate(int year,int month,int day){
  DateTime date = new DateTime(year,month,day);
  final DateTime now = DateTime.now();
  return date.isBefore(DateTime(now.year,now.month,now.day));
}

bool isAfterCurrentDate(int year,int month,int day){
  DateTime date = new DateTime(year,month,day);
  final DateTime now = DateTime.now();
  return date.isAfter(DateTime(now.year,now.month,now.day));
}

int getDaysInMonth(int year,int month){
  return month<DateTime.monthsPerYear?DateTime(year,month+1,0).day:DateTime(year+1,1,0).day;
}

int getNextMonth(int month,int year){
  return (month == 12) ? month = 1 : month + 1;
}

int getNextYear(int month,int year){
  return (month == 12) ? year + 1 : year;
}

int getPreviousMonth(int month,int year){
  return (month == 1) ? month=12 : month - 1;
}

int getPreviousYear(int month,int year){
  return (month == 1) ? year - 1 : year;
}

const List<String> _monthList = const <String>[
  '1月',
  '2月',
  '3月',
  '4月',
  '5月',
  '6月',
  '7月',
  '8月',
  '9月',
  '10月',
  '11月',
  '12月',
];


// const List<String> _monthList = const <String>[
//   'January',
//   'February',
//   'March',
//   'April',
//   'May',
//   'June',
//   'July',
//   'August',
//   'September',
//   'October',
//   'November',
//   'December',
// ];



String getMonthTitle(int month){
  return _monthList[month - 1];
}

String getDateFormat(DateTime date){
  return DateFormat.yMMMMd(Intl.defaultLocale).format(date);
}

String getTimeFormat(BuildContext context,DateTime date){
  if(MediaQuery.of(context).alwaysUse24HourFormat)
    return DateFormat.Hm(Intl.defaultLocale).format(date);
  else
    return DateFormat.jm(Intl.defaultLocale).format(date);
}
