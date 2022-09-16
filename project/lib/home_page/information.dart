import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/provider/user_data.dart';
import 'package:test1/home.dart';
import 'package:test1/sign_up.dart';

class informationPage extends StatelessWidget{
  const informationPage({Key? key}) : super(key: key);
  @override



  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body:TheInformationPage()
    );
  }
}

class TheInformationPage extends StatefulWidget{
  @override
  State<TheInformationPage> createState() => _TheInformationPage();
}

Widget InformationPageMobile (BuildContext context){

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                '影像辨識結果說明',style: TextStyle(fontSize: 32),
              ),
              Container( //七型別
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Container(  //標題
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        '布里斯托糞便七型別分類',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,
                      ),
                    ),
                    Container(  //表頭
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.3),
                            ),
                            width: MediaQuery.of(context).size.width * 0.145,
                            child: Text('數值',textAlign: TextAlign.center,),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('代表意義',textAlign: TextAlign.center,),
                          ),
                          Container(
                            // decoration: new BoxDecoration(
                            //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            // ),
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text('健康分數',textAlign: TextAlign.center,),
                          ),
                        ],
                      ),
                    ),
                    Container(  //值1
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('1',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道太長、水分不夠、不良腸菌，屬於便祕型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值2
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('2',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道太長、水分不夠、不良腸菌，屬於便祕型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1.5',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值3
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('3',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('狀況良好，繼續保持，屬於正常型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 2.5',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值4
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('4',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('狀況良好，繼續保持，屬於正常型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 2.5',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值5
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('5',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1.5',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值6
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('6',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('0',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值7
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Center(child:Text('7',textAlign: TextAlign.center,),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((9990 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('0',textAlign: TextAlign.center,) ,)

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container( //氣泡比
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '氣泡比',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Text('數值',textAlign: TextAlign.center,),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值<=30
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.145,
                                child: Center(child:Text('<=30',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('腸胃道消化功能正常',textAlign: TextAlign.center,),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+2.5',textAlign: TextAlign.center,) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值30~60
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6298 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.145,
                                child: Center(child:Text('30~60',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6298 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('消化功能不良，胃腸道功能紊亂',textAlign: TextAlign.center,),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6298 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+1.5',textAlign: TextAlign.center,) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值>60
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((13596 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.145,
                                child: Center(child:Text('>60',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((13596 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('腸道蠕動差，引起胃腸內容物瀦留，菌群失調，細菌分解發酵產生氣體',textAlign: TextAlign.center,),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height:  ((13596 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('0',textAlign: TextAlign.center,) ,)

                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container( //體外血
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '體外血',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Text('結果',textAlign: TextAlign.center,),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 否
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.145,
                                child: Center(child:Text('否',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('無體外血，腸道正常',textAlign: TextAlign.center,),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+2.5',textAlign: TextAlign.center,) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值 是
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.145,
                                child: Center(child:Text('是',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('含有體外血，建議盡快就醫檢查',textAlign: TextAlign.center,),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((6288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('0',textAlign: TextAlign.center,) ,)

                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container( // 色域
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '色域分析',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.145,
                              child: Text('顏色',textAlign: TextAlign.center,),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: new BoxDecoration(
                            border: new Border.all(color: Color(0xFF000000),width: 0.3),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.145,
                                    height: ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黃色',textAlign: TextAlign.center,),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.145,
                                    height:  ((24028 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('綠色',textAlign: TextAlign.center,),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.145,
                                    height: ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('灰色',textAlign: TextAlign.center,),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.145,
                                    height: ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黑色',textAlign: TextAlign.center,),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.145,
                                    height:  ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('紅色',textAlign: TextAlign.center,),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黃色表示你的食物通過您的消化道太快，例如腹瀉。如果糞便有很多油或有惡臭，它可能表示營養吸收不良。',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((24028 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('綠色意味著你的食物並沒有經過腸子正確的處理。通常膽汁沒有分解完全，所以會造成綠色的大便。綠色的糞便也可能是你吃了太多糖，水果和蔬菜，而攝取的穀類和鹽份不足。',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('灰色顯示含有未消化的脂肪或大量使用含有氫氧化鋁的藥物。也能是膽管阻塞而引起的膽汁缺乏而造成的。',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黑色是一個上消化道出血的嚴重警訊，有可能是胃。',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('紅色鮮紅的糞便可能是下消化道出血的徵兆，可能是大腸或直腸。但痔瘡也可能造成紅色糞便。',textAlign: TextAlign.center,style: TextStyle(fontSize: 12),),),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                ),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:  (((15576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 4 +((24028 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1)) * 10,
                                child: Center(
                                  child: Text(
                                      '若黃色超過60%：+ 2\r\n\r\n若黃色超過50%，且綠色超過10%：+ 1.5\r\n\r\n若黃色超過50%，且紅色低於8%：+ 1.5\r\n\r\n若黑色低於40%，且紅色低於8%：+ 1.5'
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text('正常的糞便應為黃色加一點綠色'),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 30,
              ),
              Text(
                '健康分數說明',style: TextStyle(fontSize: 32),
              ),
              Container( //健康分數
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '健康分數',style: TextStyle(fontSize: 24),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.295,
                              child: Text('數值',textAlign: TextAlign.center,),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text('代表意義',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.295,
                                child: Center(child:Text('>= 7',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況正常',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 4~7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.295,
                                child: Center(child:Text('4 ~ 7',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況輕度不健康',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 4~7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.295,
                                child: Center(child:Text('< 4',textAlign: TextAlign.center,),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((3144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況非常不健康',textAlign: TextAlign.center,),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

Widget InformationPageDesktop (BuildContext context){

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                '影像辨識結果說明',style: TextStyle(fontSize: 48),
              ),
              Container( //七型別
                decoration: new BoxDecoration(
                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                ),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Container(  //標題
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                        '布里斯托糞便七型別分類',style: TextStyle(fontSize: 36),textAlign: TextAlign.center,
                      ),
                    ),
                    Container(  //表頭
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.3),
                            ),
                            width: MediaQuery.of(context).size.width * 0.148,
                            child: Text('數值',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('代表意義',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                            // decoration: new BoxDecoration(
                            //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            // ),
                            width: MediaQuery.of(context).size.width * 0.25,
                            child: Text('健康分數',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                        ],
                      ),
                    ),
                    Container(  //值1
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('1',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道太長、水分不夠、不良腸菌，屬於便祕型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值2
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('2',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道太長、水分不夠、不良腸菌，屬於便祕型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值3
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('3',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('狀況良好，繼續保持，屬於正常型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 2.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值4
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('4',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('狀況良好，繼續保持，屬於正常型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 2.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值5
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('+ 1.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值6
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('6',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                    Container(  //值7
                      decoration: new BoxDecoration(
                        border: new Border.all(color: Color(0xFF000000),width: 0.3),
                      ),
                      child: Row(
                        children: [
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Center(child:Text('7',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                          ),
                          Container(
                            decoration: new BoxDecoration(
                              border: new Border.all(color: Color(0xFF000000),width: 0.5),
                            ),
                            height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Text('腸道發炎、食物刺激、水分無法吸收，屬於腹瀉型',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                          ),
                          Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((40050 / (MediaQuery.of(context).size.width * 0.4))/10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Center(child:Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container( //氣泡比
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '氣泡比',style: TextStyle(fontSize: 36),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.148,
                              child: Text('數值',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值<=30
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.1485,
                                child: Center(child:Text('<=30',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('腸胃道消化功能正常',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+2.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值30~60
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.1485,
                                child: Center(child:Text('30~60',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('消化功能不良，胃腸道功能紊亂',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+1.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值>60
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.1485,
                                child: Center(child:Text('>60',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('腸道蠕動差，引起胃腸內容物瀦留，菌群失調，細菌分解發酵產生氣體',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container( //體外血
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '體外血',style: TextStyle(fontSize: 36),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Text('結果',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 否
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.1485,
                                child: Center(child:Text('否',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('無體外血，腸道正常',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('+2.5',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                            ),
                          ],
                        ),
                      ),
                      Container(  //值 是
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.1485,
                                child: Center(child:Text('是',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Center(child: Text('含有體外血，建議盡快就醫檢查',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                            ),
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((30288 / (MediaQuery.of(context).size.width * 0.4)) / 30 + 1) * 30,
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Center(child:Text('0',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),) ,)

                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container( // 色域
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '色域分析',style: TextStyle(fontSize: 36),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.1485,
                              child: Text('顏色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text('代表意義',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              // decoration: new BoxDecoration(
                              //   border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              // ),
                              width: MediaQuery.of(context).size.width * 0.25,
                              child: Text('健康分數',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          decoration: new BoxDecoration(
                            border: new Border.all(color: Color(0xFF000000),width: 0.3),
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.1485,
                                    height: ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黃色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.1485,
                                    height:  ((111008 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('綠色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.1485,
                                    height: ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('灰色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.1485,
                                    height: ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黑色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.1485,
                                    height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('紅色',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黃色表示你的食物通過您的消化道太快，例如腹瀉。如果糞便有很多油或有惡臭，它可能表示營養吸收不良。',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((111008 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('綠色意味著你的食物並沒有經過腸子正確的處理。通常膽汁沒有分解完全，所以會造成綠色的大便。綠色的糞便也可能是你吃了太多糖，水果和蔬菜，而攝取的穀類和鹽份不足。',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('灰色顯示含有未消化的脂肪或大量使用含有氫氧化鋁的藥物。也能是膽管阻塞而引起的膽汁缺乏而造成的。',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('黑色是一個上消化道出血的嚴重警訊，有可能是胃。',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),),
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                      border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                    ),
                                    width: MediaQuery.of(context).size.width * 0.4,
                                    height:  ((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 10,
                                    child: Center(child: Text('紅色鮮紅的糞便可能是下消化道出血的徵兆，可能是大腸或直腸。但痔瘡也可能造成紅色糞便。',textAlign: TextAlign.center,style: TextStyle(fontSize: 24),),),
                                  ),
                                ],
                              ),
                              Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.3),
                                ),
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:  (((60576 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1) * 4 +((111008 / (MediaQuery.of(context).size.width * 0.4)) / 10 + 1)) * 10,
                                child: Center(
                                  child: Text(
                                      '若黃色超過60%：+ 2\r\n\r\n若黃色超過50%，且綠色超過10%：+ 1.5\r\n\r\n若黃色超過50%，且紅色低於8%：+ 1.5\r\n\r\n若黑色低於40%，且紅色低於8%：+ 1.5',style: TextStyle(fontSize: 28),
                                  ),
                                ),
                              )
                            ],
                          )
                      ),
                      Container(
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Center(
                          child: Text('正常的糞便應為黃色加一點綠色',style: TextStyle(fontSize: 28),),
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 30,
              ),
              Text(
                '健康分數說明',style: TextStyle(fontSize: 48),
              ),
              Container( //健康分數
                  decoration: new BoxDecoration(
                    border: new Border.all(color: Color(0xFF000000),width: 0.5),
                  ),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Column(
                    children: [
                      Container(  //標題
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          '健康分數',style: TextStyle(fontSize: 36),textAlign: TextAlign.center,
                        ),
                      ),
                      Container(  //表頭
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.3),
                              ),
                              width: MediaQuery.of(context).size.width * 0.2985,
                              child: Text('數值',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text('代表意義',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.2987,
                                child: Center(child:Text('>= 7',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況正常',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 4~7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.2987,
                                child: Center(child:Text('4 ~ 7',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況輕度不健康',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                      Container(  //值 4~7
                        decoration: new BoxDecoration(
                          border: new Border.all(color: Color(0xFF000000),width: 0.3),
                        ),
                        child: Row(
                          children: [
                            Container(
                                decoration: new BoxDecoration(
                                  border: new Border.all(color: Color(0xFF000000),width: 0.5),
                                ),
                                height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                                width: MediaQuery.of(context).size.width * 0.2987,
                                child: Center(child:Text('< 4',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),)

                            ),
                            Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(color: Color(0xFF000000),width: 0.5),
                              ),
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: ((15144 / (MediaQuery.of(context).size.width * 0.4)) / 20 + 1) * 20,
                              child: Text('腸道狀況非常不健康',textAlign: TextAlign.center,style: TextStyle(fontSize: 28),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
              Container(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _TheInformationPage extends State<TheInformationPage>{

  @override
  Widget build(BuildContext context){
    print((6288 / (MediaQuery.of(context).size.width * 0.4)));
    return ScreenTypeLayout(
      mobile: InformationPageMobile(context),
      tablet: InformationPageDesktop(context),
    );
  }

}