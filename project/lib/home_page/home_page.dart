import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test1/calendar/Activity.dart';
import 'package:test1/calendar/date.dart';
import 'package:test1/home_page/diary_detail.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/home.dart';
import 'package:test1/calendar/Month.dart';
import 'package:test1/calendar/Year_Page.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/calender.dart';
import 'package:test1/provider/old_diary.dart';
import 'package:charts_flutter/flutter.dart' as charts;



DateTime startTime = DateTime.now().subtract(Duration(days: 30)),endTime = DateTime.now();
class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);
  @override



  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:TheHomePage()
    );
  }

}

class TheHomePage extends StatefulWidget{
  @override
  State<TheHomePage> createState() => _TheHomePage();
}

// Future<void> hiveInitialize() async{
//   await Hive.initFlutter();
//   Hive.registerAdapter<Activity>(ActivityAdapter());
//   await Hive.openBox<Activity>(activityBoxName);
// }

class _TheHomePage extends State<TheHomePage>{
  late int month;
  late int year;
  int index = 0;
  late List<chartData> data;
  late TooltipBehavior _tooltipBehavior;

  Future<dynamic> _onrefresh() async{
    final cart3 = Provider.of<home_data>(context,listen: false);
    cart3.getHomeData(DateTime.now().year.toString(), DateTime.now().month.toString());
    HomePage();
  }


  void initState(){
    month = DateTime.now().month;
    year = DateTime.now().year;
    _tooltipBehavior = TooltipBehavior(enable: true);
    final cart3 = Provider.of<home_data>(context,listen: false);
    cart3.getHomeData(year.toString(), month.toString());
  }

  void onHorizontalDragEnd(c.DragEndDetails value){
    if(value.primaryVelocity == null) return;
    if(value.primaryVelocity!.isNegative){
      setState((){
        year = getNextYear(month, year);
        month = getNextMonth(month, year);
        index < 28 ? index += 1 : index = 0;
        final cart3 = Provider.of<home_data>(context,listen: false);
        cart3.getHomeData(year.toString(), month.toString());
      });
    }
    else if(value.primaryVelocity! > 0){
      setState(() {
        year = getPreviousYear(month, year);
        month = getPreviousMonth(month, year);
        index > 0 ? index -= 1 : index = 28;
        final cart3 = Provider.of<home_data>(context,listen: false);

        cart3.getHomeData(year.toString(), month.toString());
      });
    }
  }

  void PreviousMonthButton(){
    setState(() {
      year = getPreviousYear(month, year);
      month = getPreviousMonth(month, year);
      index > 0 ? index -= 1 : index = 28;
      final cart3 = Provider.of<home_data>(context,listen: false);

      cart3.getHomeData(year.toString(), month.toString());
    });
  }

  void NextMonthButton(){
    setState((){
      year = getNextYear(month, year);
      month = getNextMonth(month, year);
      index < 28 ? index += 1 : index = 0;
      final cart3 = Provider.of<home_data>(context,listen: false);
      cart3.getHomeData(year.toString(), month.toString());
    });
  }

  Widget HomePageMobile (BuildContext context){
    final cart = Provider.of<old_diary>(context,listen: false);
    this.data = cart.data;
    final cart3 = Provider.of<home_data>(context,listen: false);
    cart3.getHomeData(DateTime.now().year.toString(), DateTime.now().month.toString());
    _tooltipBehavior = TooltipBehavior(enable: true);
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: _onrefresh,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: c.CupertinoDynamicColor.resolve(
                        c.CupertinoColors.systemBackground,
                        context,
                      ),
                    ),
                    c.CupertinoPageScaffold(
                      backgroundColor: Color(0x00000000),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Container(
                              height: 44,
                            ),
                            Container(
                              child: c.GestureDetector(
                                onHorizontalDragEnd: onHorizontalDragEnd,
                                child: Container(
                                  padding: const c.EdgeInsets.symmetric(horizontal: 12),
                                  child: Month(
                                    month: month,
                                    year: year,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Text("查詢時間：",style: TextStyle(fontSize: 16),textAlign: TextAlign.end,),
                        ),
                        ElevatedButton(
                          onPressed: () async{
                            var r = await showDateRangePicker(
                                context: context,
                                initialDateRange: DateTimeRange(start: cart.startTime, end: cart.endTime),
                                firstDate: DateTime(2020,01,01),
                                lastDate: DateTime.now()
                            );

                            if(r != null){
                              startTime = r.start;
                              endTime = r.end;
                              await cart.getResult(r.start, r.end);
                              print('start:'+cart.startTime.toString());
                              setState(() {
                                HomePage();
                              });

                            }
                          },
                          style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                          child: Text(DateFormat("yyyy/MM/dd").format(cart.startTime) + "~" + DateFormat("yyyy/MM/dd").format(cart.endTime),style: TextStyle(color: Colors.white),),
                        )
                      ],
                    ),
                    Container(
                      child: SfCartesianChart(
                        title: ChartTitle(text: "健康度趨勢圖",textStyle: TextStyle(fontSize: 16,),),
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: DateTimeAxis(
                            intervalType: DateTimeIntervalType.days,
                            title: AxisTitle(
                                text: '日期',
                                textStyle: TextStyle(fontSize: 14)
                            )
                        ),
                        primaryYAxis: NumericAxis(
                            rangePadding: ChartRangePadding.additional,
                            title: AxisTitle(
                                text: '健康度',
                                textStyle: TextStyle(fontSize: 14)
                            )
                        ),
                        series: <ChartSeries<chartData,DateTime>>[
                          LineSeries<chartData,DateTime>(
                              dataSource: cart.data,
                              xValueMapper: (chartData data,_) => data.time,
                              yValueMapper: (chartData data,_) => data.hscore,
                              markerSettings: MarkerSettings(
                                isVisible: true,
                                shape: DataMarkerType.circle,
                              ),
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                useSeriesColor: true,
                              )

                          ),

                        ],
                        onTooltipRender: (TooltipArgs args) async {
                          for(int i=0;i<cart.body.length;i++){
                            if(args.pointIndex == i){
                              await cart.getDetail(cart.body[i]['_id'], cart.body[index]['imgID']);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return DetailDiary();
                                }),
                              );
                            }
                          }
                        },
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        )
    );
  }

  Widget HomePageDesktop (BuildContext context){
    final cart = Provider.of<old_diary>(context,listen: false);
    this.data = cart.data;
    final cart3 = Provider.of<home_data>(context,listen: false);
    cart3.getHomeData(DateTime.now().year.toString(), DateTime.now().month.toString());
    _tooltipBehavior = TooltipBehavior(enable: true);
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: _onrefresh,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: c.CupertinoDynamicColor.resolve(
                        c.CupertinoColors.systemBackground,
                        context,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: IconButton(
                            padding: new EdgeInsets.all(0.0),
                            iconSize: 48,
                            onPressed: PreviousMonthButton,
                            icon: Icon(Icons.arrow_back_ios_rounded),
                          ),
                        ),
                        Expanded(
                            child: c.CupertinoPageScaffold(
                              backgroundColor: Color(0x00000000),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Container(
                                      height: 44,
                                    ),
                                    Container(
                                      child: c.GestureDetector(
                                        child: Container(
                                          // padding: const c.EdgeInsets.symmetric(horizontal: 12),
                                          child: Month(
                                            month: month,
                                            year: year,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: IconButton(
                            padding: new EdgeInsets.all(0.0),
                            iconSize: 48,
                            onPressed: NextMonthButton,
                            icon: Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        )

                      ],
                    ),
                    Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text("查詢時間：",style: TextStyle(fontSize: 28),textAlign: TextAlign.end,),
                          ),
                          ElevatedButton(
                            onPressed: () async{
                              var r = await showDateRangePicker(
                                  context: context,
                                  initialDateRange: DateTimeRange(start: cart.startTime, end: cart.endTime),
                                  firstDate: DateTime(2020,01,01),
                                  lastDate: DateTime.now()
                              );

                              if(r != null){
                                startTime = r.start;
                                endTime = r.end;
                                await cart.getResult(r.start, r.end);
                                print('start:'+cart.startTime.toString());
                                setState(() {
                                  HomePage();
                                });

                              }
                            },
                            style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                            child: Text(DateFormat("yyyy/MM/dd").format(cart.startTime) + "~" + DateFormat("yyyy/MM/dd").format(cart.endTime),style: TextStyle(fontSize: 28,color: Colors.white),),
                          )
                        ],
                      ),
                    Container(
                      child: SfCartesianChart(
                        title: ChartTitle(text: "健康度趨勢圖",textStyle: TextStyle(fontSize: 16,),),
                        tooltipBehavior: _tooltipBehavior,
                        primaryXAxis: DateTimeAxis(
                            intervalType: DateTimeIntervalType.days,
                            title: AxisTitle(
                                text: '日期',
                                textStyle: TextStyle(fontSize: 14)
                            )
                        ),
                        primaryYAxis: NumericAxis(
                            rangePadding: ChartRangePadding.additional,
                            title: AxisTitle(
                                text: '健康度',
                                textStyle: TextStyle(fontSize: 14)
                            )
                        ),
                        series: <ChartSeries<chartData,DateTime>>[
                          LineSeries<chartData,DateTime>(
                              dataSource: cart.data,
                              xValueMapper: (chartData data,_) => data.time,
                              yValueMapper: (chartData data,_) => data.hscore,
                              markerSettings: MarkerSettings(
                                isVisible: true,
                                shape: DataMarkerType.circle,
                              ),
                              dataLabelSettings: DataLabelSettings(
                                isVisible: true,
                                useSeriesColor: true,
                              )

                          ),

                        ],
                        onTooltipRender: (TooltipArgs args) async {
                          for(int i=0;i<cart.body.length;i++){
                            if(args.pointIndex == i){
                              await cart.getDetail(cart.body[i]['_id'], cart.body[index]['imgID']);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context){
                                  return DetailDiary();
                                }),
                              );
                            }
                          }
                        },
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        )
    );
  }

  Widget HomePageWatch (BuildContext){
    final cart = Provider.of<old_diary>(context,listen: false);
    this.data = cart.data;
    final cart3 = Provider.of<home_data>(context,listen: false);
    cart3.getHomeData(DateTime.now().year.toString(), DateTime.now().month.toString());
    _tooltipBehavior = TooltipBehavior(enable: true);
    return Scaffold(
        body: RefreshIndicator(
          onRefresh: _onrefresh,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: c.CupertinoDynamicColor.resolve(
                        c.CupertinoColors.systemBackground,
                        context,
                      ),
                    ),
                    c.CupertinoPageScaffold(
                      backgroundColor: Color(0x00000000),
                      child: SafeArea(
                        child: Column(
                          children: [
                            Container(
                              height: 44,
                            ),
                            Container(
                              child: c.GestureDetector(
                                child: Container(
                                  padding: const c.EdgeInsets.symmetric(horizontal: 12),
                                  child: Month(
                                    month: month,
                                    year: year,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        )
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return ScreenTypeLayout(
        mobile: HomePageMobile(context),
      tablet: HomePageDesktop(context),
      watch: HomePageWatch(context),

    );


  }

  List<charts.Series<chartData, DateTime>> _createSampleData() {
    return [
      new charts.Series<chartData, DateTime>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (chartData data, _) => data.time,
        measureFn: (chartData data, _) => data.hscore,
        data: data,
      )
    ];
  }

}
class YearButton extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: (){
        Navigator.of(context,rootNavigator: true).pushNamed(YearPage.route);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          const Padding(padding: EdgeInsetsDirectional.only(start:8.0),),
          Text('Year'),
          const Padding(padding: EdgeInsetsDirectional.only(start: 6.0)),
        ],
      ),
    );
  }
}