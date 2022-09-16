import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/provider/user_data.dart';
import 'package:test1/provider/old_diary.dart';
import 'package:test1/home.dart';

class DetailDiary extends StatelessWidget{
  const DetailDiary({Key? key,}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body: TheDetailPage()
    );
  }
}

class TheDetailPage extends StatefulWidget{
  @override
  State<TheDetailPage> createState() => _TheDetailPage();
}

void setPageTitle(String title, BuildContext context) {
  SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
    label: title,
    primaryColor: Theme.of(context).primaryColor.value, // This line is required
  ));
}

class _TheDetailPage extends State<TheDetailPage>{


  @override
  Widget build(BuildContext context){

    final cart = Provider.of<old_diary>(context,listen: false);
    var color = [0XFF000000,0XFFFF0000];
    var trueOrFalse = ['否','是'];
    FirebaseAuth auth = FirebaseAuth.instance;
    Map<String, double> dataMap = {
      "紅" : cart.detail['color'][0][2],
      "黑" : cart.detail['color'][0][3],
      "綠" : cart.detail['color'][0][1],
      "白" : cart.detail["color"][0][4],
      "黃" : cart.detail["color"][0][0],
      "其他" : cart.detail["color"][0][5],
    };
    List<Color> colorList = [Color(0xFFFF9797),Color(0xFF3C3C3C),Color(0xffBBFFBB),Color(0xFFD0D0D0),Color(0xFFFFFFB9),Color(0xFFACD6FF)];
    setPageTitle('詳細資料', context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('詳細資料'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions:<Widget> [IconButton(icon: Icon(MyFlutterApp.sign_out),onPressed:
            (){
          try{
            auth.signOut();
            for(int i=0;i<1055000000;i++){

            }
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context){
                return LoginPage();
              }),
              (Route<dynamic> route) => false,
            );
          }
          catch(error){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(error.toString()),duration: const Duration(milliseconds: 800),
            ));
          }
        },)],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 15,
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text(cart.detail['time'][0].toString(),style: TextStyle(fontSize: 20),)
                  ]),
              ),
              Container(
                  height: 50,
                  child:Row(
                    children: [
                      Text('健康分數：',style: TextStyle(fontSize: 20),),
                      Text(cart.detail['hscore'][0].toString(),style: TextStyle(color: Color(color[cart.detail['hscore'][1]]),fontSize: 20),)
                    ],
                  )
              ),
              Container(
                height: 50,
                child:Row(
                  children: [
                    Text('光譜資料是否含血：',style: TextStyle(fontSize: 20),),
                    Text(cart.detail['spec'][0],style: TextStyle(color: Color(color[cart.detail['spec'][1]]),fontSize: 20),)
                  ],
                )
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Text('糞便相片辨識結果：',style: TextStyle(fontSize: 20),),
                  ],
                )
              ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('')
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('結果：',style: TextStyle(fontSize: 20),),
                    ),
                    Expanded(
                        flex: 6,
                        child: Text(cart.detail['resultString'],style: TextStyle(fontSize: 16),)
                    ),
                    Expanded(
                        flex: 1,
                        child: Text('')
                    )

                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text('')
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('七型別：',style: TextStyle(fontSize: 20),),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(cart.detail['bss'][0],style: TextStyle(color: Color(color[cart.detail['bss'][1]]),fontSize: 20),)
                    ),
                    Expanded(
                      flex: 2,
                      child: Text('')
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('')
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('條數：',style: TextStyle(fontSize: 20),),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(cart.detail['stoolCnt'][0],style: TextStyle(color: Color(color[cart.detail['stoolCnt'][1]]),fontSize: 20),)
                    ),
                    Expanded(
                        flex: 2,
                        child: Text('')
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('')
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('氣泡比：',style: TextStyle(fontSize: 20),),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(cart.detail['bubble'][0],style: TextStyle(color: Color(color[cart.detail['bubble'][1]]),fontSize: 20),)
                    ),
                    Expanded(
                        flex: 2,
                        child: Text('')
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('')
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('是否含體外血：',style: TextStyle(fontSize: 14),),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(cart.detail['blood'][0],style: TextStyle(color: Color(color[cart.detail['blood'][1]]),fontSize: 20),)
                    ),
                    Expanded(
                        flex: 2,
                        child: Text('')
                    )
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('')
                    ),
                    Expanded(
                      flex: 4,
                      child: Text('備註：',style: TextStyle(fontSize: 20),),
                    ),
                    Expanded(
                        flex: 3,
                        child: Text(cart.detail['ps'][0],style: TextStyle(color: Color(color[cart.detail['ps'][1]]),fontSize: 20),)
                    ),
                    Expanded(
                        flex: 2,
                        child: Text('')
                    )
                  ],
                ),
              ),

              Container(
                height: 10,
              ),
              Container(
                height: 250,
                child: Column(
                  children: [
                    PieChart(
                      dataMap: dataMap,
                      animationDuration: Duration(milliseconds: 1200),
                      chartLegendSpacing: 32,
                      chartRadius: 200,
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: ChartType.disc,
                      legendOptions: LegendOptions(
                        showLegendsInRow: false,
                        legendPosition: LegendPosition.right,
                        showLegends: true,
                        legendTextStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        )

                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValues: false,
                      ),
                    ),
                    Text('▲色域比例',style: TextStyle(fontSize: 20,),)
                  ],
                ),
              ),
              Container(
                height: 50,
                child: Row(
                    children: [
                      Text('糞便原始相片：',style: TextStyle(fontSize: 20),),
                    ],
                  )
              ),
              Container(
                height: 200,
                child: Image.network('http://203.145.206.20:5000/picture/' + cart.imgid),
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }

  
}