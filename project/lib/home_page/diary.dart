import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/home.dart';
import 'package:test1/home_page/diary_detail.dart';
import 'package:test1/provider/old_diary.dart';


DateTime startTime = DateTime.now(),endTime = DateTime.now();
class DiaryPage extends StatelessWidget{
  const DiaryPage({Key? key,required startTime,required endTime}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:TheDiaryPage()
    );
  }

}

class TheDiaryPage extends StatefulWidget{
  @override
  State<TheDiaryPage> createState() => _TheDiaryPage();
}



class _TheDiaryPage extends State<TheDiaryPage>{

  Widget DiaryMobile(BuildContext context){
    final cart = Provider.of<old_diary>(context,listen: false);
    List<dynamic> result = cart.body;
    var color = [0XFF000000,0XFFFF0000];

    Future<dynamic> _onrefresh() async{
      cart.getResult(cart.startTime, cart.endTime);
      DiaryPage(startTime:cart.startTime, endTime:cart.endTime);
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
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
                      setState(() {
                        DiaryPage(startTime: startTime, endTime: endTime);
                      });

                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  child: Text(DateFormat("yyyy/MM/dd").format(cart.startTime) + "~" + DateFormat("yyyy/MM/dd").format(cart.endTime),style: TextStyle(color: Colors.white),),
                )
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                  onRefresh: _onrefresh,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cart.body.length,
                        itemBuilder: (context, index) {
                          return Card(
                            margin: const EdgeInsets.all(30.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                    color: Color(0xFF9D9D9D),
                                    width: 1.5
                                )
                            ),
                            child: InkWell(
                                onTap: () async {
                                  await cart.getDetail(cart.body[index]['_id'], cart.body[index]['imgID']);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context){
                                      return DetailDiary();
                                    }),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Expanded(  //日期與時間
                                        flex: 3,
                                        child:SizedBox(
                                          height: 120,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 25,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                      border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                    ),
                                                    width: MediaQuery.of(context).size.width * 0.3,
                                                    child: Center(
                                                      child: Text(cart.body[index]['time'].split('-')[0].split('/')[0],style: TextStyle(fontSize:16),),
                                                    )

                                                ),
                                              ),
                                              Expanded(
                                                flex: 50,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                      border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                    ),
                                                    width: MediaQuery.of(context).size.width * 0.3,
                                                    child: Center(
                                                      child: Text(cart.body[index]['time'].split('-')[0].split('/')[1] + '/' + result[index]['time'].split('-')[0].split('/')[2],style: TextStyle(fontSize: 28),),
                                                    )

                                                ),
                                              ),
                                              Expanded(
                                                flex: 25,
                                                child: Container(
                                                    decoration: new BoxDecoration(
                                                      border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                    ),
                                                    width: MediaQuery.of(context).size.width * 0.3,
                                                    child: Center(
                                                      child: Text(cart.body[index]['time'].split('-')[1],style: TextStyle(fontSize: 16),),
                                                    )

                                                ),
                                              ),
                                            ],

                                          ),
                                        )

                                    ),
                                    Expanded(  //結果
                                        flex: 7,
                                        child: SizedBox(
                                          height: 120,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                flex:7,
                                                child: Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                  ),

                                                  child: Row(
                                                    children: [
                                                      Text(' 健康分數：',style: TextStyle(fontSize: 24),),
                                                      Text(cart.body[index]['hscore'][0].toString(),style: TextStyle(fontSize: 24,color: Color(color[cart.body[index]['hscore'][1]])),)
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 14,
                                                child: Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Text(' 備註：',style: TextStyle(fontSize: 24),),
                                                      Expanded(child: Text(cart.body[index]['ps'],style: TextStyle(fontSize: 20),))

                                                    ],
                                                  ),
                                                ),
                                              )


                                            ],
                                          ),
                                        )
                                    ),
                                  ],
                                )
                            ),
                          );
                        }),
                  )
              ),
            ),


          ],
        ),
      ),
    );
  }

  Widget DiaryDesktop(BuildContext context){
    final cart = Provider.of<old_diary>(context,listen: false);
    List<dynamic> result = cart.body;
    var color = [0XFF000000,0XFFFF0000];

    Future<dynamic> _onrefresh() async{
      cart.getResult(cart.startTime, cart.endTime);
      DiaryPage(startTime:cart.startTime, endTime:cart.endTime);
    }
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.45,
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
                      setState(() {
                        DiaryPage(startTime: startTime, endTime: endTime);
                      });

                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                  child: Text(DateFormat("yyyy/MM/dd").format(cart.startTime) + "~" + DateFormat("yyyy/MM/dd").format(cart.endTime),style: TextStyle(fontSize: 28,color: Colors.white),),
                )
              ],
            ),
            Expanded(
              child: RefreshIndicator(
                  onRefresh: _onrefresh,
                  child: SingleChildScrollView(
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: cart.body.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(16),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                      color: Color(0xFF9D9D9D),
                                      width: 1.5
                                  )
                              ),
                              child: InkWell(
                                  onTap: () async {
                                    await cart.getDetail(cart.body[index]['_id'], cart.body[index]['imgID']);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context){
                                        return DetailDiary();
                                      }),
                                    );
                                  },
                                  child: Row(

                                    children: [
                                      Expanded(  //日期與時間
                                          flex: 3,
                                          child:SizedBox(
                                            height: 120,
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 25,
                                                  child: Container(
                                                      decoration: new BoxDecoration(
                                                        border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                      ),
                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                      child: Center(
                                                        child: Text(cart.body[index]['time'].split('-')[0].split('/')[0],style: TextStyle(fontSize: 20),),
                                                      )

                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 50,
                                                  child: Container(
                                                      decoration: new BoxDecoration(
                                                        border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                      ),
                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                      child: Center(
                                                        child: Text(cart.body[index]['time'].split('-')[0].split('/')[1] + '/' + result[index]['time'].split('-')[0].split('/')[2],style: TextStyle(fontSize: 32),),
                                                      )

                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 25,
                                                  child: Container(
                                                      decoration: new BoxDecoration(
                                                        border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                      ),
                                                      width: MediaQuery.of(context).size.width * 0.3,
                                                      child: Center(
                                                        child: Text(cart.body[index]['time'].split('-')[1],style: TextStyle(fontSize: 20),),
                                                      )

                                                  ),
                                                ),
                                              ],

                                            ),
                                          )

                                      ),
                                      Expanded(  //結果
                                          flex: 7,
                                          child: SizedBox(
                                            height: 120,
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex:7,
                                                  child: Container(
                                                    decoration: new BoxDecoration(
                                                      border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                    ),

                                                    child: Row(
                                                      children: [
                                                        Text(' 健康分數：',style: TextStyle(fontSize: 28),),
                                                        Text(cart.body[index]['hscore'][0].toString(),style: TextStyle(fontSize: 28,color: Color(color[cart.body[index]['hscore'][1]])),)
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 14,
                                                  child: Container(
                                                    decoration: new BoxDecoration(
                                                      border: new Border.all(color: Color(0xFFD0D0D0),width: 0.5),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Text(' 備註：',style: TextStyle(fontSize: 28),),
                                                        Expanded(child: Text(cart.body[index]['ps'],style: TextStyle(fontSize: 24),))

                                                      ],
                                                    ),
                                                  ),
                                                )


                                              ],
                                            ),
                                          )
                                      ),

                                    ],
                                  )
                              ),
                            ),
                          );
                        }),
                  )
              ),
            ),


          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var selecDateTime;

    return ScreenTypeLayout(
        mobile: DiaryMobile(context),
      desktop: DiaryDesktop(context),
    );


  }



}