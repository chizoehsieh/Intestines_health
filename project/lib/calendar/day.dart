import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test1/home.dart';
import 'package:test1/home_page/diary_detail.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/old_diary.dart';
import 'package:intl/intl.dart';
import 'package:test1/calendar/Activity.dart';
import 'package:test1/calendar/date.dart';
import 'package:test1/calendar/color.dart';
import 'package:test1/home_page/newDiary.dart';


class Day extends StatelessWidget{
  final Activity? activity;
  final double? size;
  final bool onPressed;

  const Day({
    this.activity,
    this.size,
    this.onPressed = true,
  });

  String _getText(){
    if(activity == null)
      return '';
    else if(activity!.day == null)
      return '';
    else
      return activity!.day.toString();
  }

  Color _getTextcolor(BuildContext context){
    if(activity == null){
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      );
    }
    else if(activity!.objid != '') {
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.tertiarySystemBackground,
        context,
      );
    }
    else{
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.label,
        context,
      );
    }
  }

  Color _getBackgroundColor(BuildContext context){
    if(activity == null){
      return const Color(0x00ffffff);
    }
    else if(activity!.objid != ''){
      print(activity);
      int? colorCode = activity!.healthId;
      if(colorCode == null || activity!.objid == ''){
        colorCode = 4;
      }
      return c.CupertinoDynamicColor.resolve(
          getColor(healthColor.values[colorCode]),
          context,
      );
    }
    else{
      return c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemGrey4,
        context,
      );
    }
  }

  void _onDayPressed(BuildContext context) async {
    final cart = Provider.of<old_diary>(context,listen: false);
    if(activity == null || isAfterCurrentDate(activity!.year, activity!.month,activity!.day)){
      AlertDialog dialog = AlertDialog(
          title: Text('不能新增資料'),
          content: Text('不能新增 '+activity!.year.toString()+'/'+activity!.month.toString()+'/'+activity!.day.toString()+'的資料'),
          actions: [
            ElevatedButton(
                onPressed: (){
                  Navigator.of(context).pop();
                },
                child: Text("確認")
            ),
          ]
      );
      showGeneralDialog(
        context: context,
        pageBuilder: (context, anim1 , anim2){
          Future.delayed(Duration(seconds: 5)).then((value) => Navigator.pop(context));
          return Wrap();
        },
        transitionBuilder: (context, anim1 , anim2, child){
          return Transform(
            transform: Matrix4.translationValues(
                0.0,
                (1.0 - Curves.easeInOut.transform(anim1.value))*400,
                0.0
            ),
            child: dialog,
          );
        },
        transitionDuration: Duration(milliseconds: 400),
      );
      // showDialog(context: context, builder: (BuildContext context){return dialog;});

    }
    else if(activity!.objid != '' && activity!.imgid != ''){
      await cart.getDetail((activity!.objid).toString(), (activity!.imgid).toString());
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context){
          return DetailDiary();
        }),
      );
    }
    else{
      DateTime select = DateFormat("yyyy/MM/dd").parse(activity!.year.toString()+'/'+activity!.month.toString()+'/'+activity!.day.toString());
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context){
          return Home(userData: '', selectedIndex: 2,selectDate: select,);
        }),
        (Route<dynamic> route) => false,
      );
    }
  }
  
  @override
  Widget build(BuildContext context){
    return LayoutBuilder(
        builder: (BuildContext context,BoxConstraints constraints){
          final double _size = (size == null) ? constraints.maxWidth : size!;
          return c.CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: (onPressed && activity != null) ? () => _onDayPressed(context) : null,
            child: Container(
              height: _size,
              width: _size,
              alignment: Alignment.center,
              margin: EdgeInsets.all(_size * 0.1),
              decoration: BoxDecoration(
                color: _getBackgroundColor(context),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _getText(),
                style: TextStyle(
                  fontSize: _size * 0.5,
                  color: _getTextcolor(context),
                ),
              ),
            ),
          );
        },
    );
  }
}