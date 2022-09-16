import 'package:flutter/widgets.dart';

import 'package:test1/calendar/Month.dart';
import 'package:test1/calendar/style.dart';

class Year extends StatefulWidget{
  final int year;

  const Year({required this.year});

  @override
  _YearState createState() => _YearState();
}

class _YearState extends State<Year>{
  final List<Month> months = [];

  @override
  void initState(){
    super.initState();
    for(int i=1;i<=12;i++){
      months.add(
        Month(
          month: i,
          year: widget.year,
          onPressed: true,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(14, 10, 0, 10),
          child: Text(
            widget.year.toString(),
            style: Style.largeTitle(context),
          ),
          alignment: Alignment.centerLeft,
        ),
        GridView.count(
            primary: false,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8,
            crossAxisCount: 3,
          children: months,
        ),
      ],
    );
  }
}