import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

import 'package:test1/calendar/Year.dart';

class YearPage extends StatefulWidget{
  static const String route = '/year';
  @override
  _YearPageState createState() => _YearPageState();
}

class _YearPageState extends State<YearPage>{
  int currentYear = DateTime.now().year;

  @override
  Widget build(BuildContext context){
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemBackground,
        context,
      ),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          reverse: true,
          itemBuilder: (context,index){
            return Year(year: currentYear - index,);
          }
        ),
      ),
    );
  }
}