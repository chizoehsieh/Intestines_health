import 'dart:async';
import 'dart:convert';
// import 'dart:html';
// import 'dart:html';
import 'dart:io';
import 'dart:ui';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';

import 'package:image_picker/image_picker.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:intl/intl.dart';
import 'package:test1/home.dart';
import 'package:test1/provider/spectrum.dart';
import 'package:test1/provider/user_data.dart';

String userData = "";

class NewDiaryPage extends StatelessWidget{
  DateTime selectedDate;
  NewDiaryPage({Key? key, required this.selectedDate}) : super(key: key);
  @override


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body:TheNewPage(selectedDate)
    );
  }

}

class TheNewPage extends StatefulWidget{

  TheNewPage(this.selectedDate);
  DateTime selectedDate;

  @override
  State<TheNewPage> createState() => _TheNewPage(selectedDate);
}

class _TheNewPage extends State<TheNewPage>{
  var selectDateTime = DateTime.now(),selectTime = TimeOfDay.now();
  var imgsrc,pstext = "";

  _TheNewPage(this.selectDateTime);
  
  Widget NewDiaryMobile(BuildContext context){
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String uid;
    if(user != null)
    {
      uid = user.uid;
    }
    else
    {
      uid = "non";
    }
    var spectrum = "";
    final cart = Provider.of<spectrumData>(context,listen: false);
    final cart2 = Provider.of<user_data>(context,listen: false);
    cart.spectrum_data = '';
    FlutterBlue flutterBlue = FlutterBlue.instance;
    FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
    StreamSubscription<BluetoothDiscoveryResult>? streamSubscription;

    var deviceName = '';

    return Scaffold(
        body:SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("時間：  ",style: TextStyle(fontSize: 16),textAlign: TextAlign.end,),
                    ),
                    ElevatedButton(
                      onPressed: ()async{
                        var result = await showDatePicker(
                            context: context,
                            initialDate: selectDateTime,
                            firstDate: DateTime(2020,01),
                            lastDate: DateTime.now()
                        );

                        if(result != null) {
                          setState(() {
                            selectDateTime = result;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      child: Text(DateFormat("yyyy/MM/dd").format(selectDateTime),style: TextStyle(color: Colors.white),),
                    ),
                    ElevatedButton(
                        onPressed: ()async{
                          var selected = await showTimePicker(
                            context: context,
                            initialTime: selectTime,
                            builder: (context,child){
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                          );
                          if(selected != null){
                            setState(() {
                              selectTime = selected;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(selectTime.format(context),style: TextStyle(color: Colors.white),)
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("糞便相片： ",style: TextStyle(fontSize: 16),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: imageView(imgsrc),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()async{
                              var image = await ImagePicker().getImage(source: ImageSource.camera);
                              File finalImage;
                              setState(() {
                                imgsrc = image;
                                finalImage = File(imgsrc.path);
                                imgsrc = finalImage;
                              });

                            },
                            icon: Icon(Icons.camera_alt)),
                        Text("相機"),
                      ],),
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()async{
                              var image = await ImagePicker().getImage(source: ImageSource.gallery);
                              setState(() {
                                imgsrc = image;
                              });
                            },
                            icon: Icon(Icons.photo_album)),
                        Text("相簿"),
                      ],)

                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("光譜資料： ",style: TextStyle(fontSize: 16),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart2.deviceName,
                        decoration: InputDecoration(hintText: '請輸入設備名稱',hintStyle: TextStyle(fontSize: 16)),
                        onChanged: (text){
                          deviceName = text;
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if(deviceName != ''){
                            cart.getSpectrumData(deviceName);
                            setState(() {
                              spectrum = cart.spectrum_data;
                              print("spectrum:"+cart.spectrum_data);
                            });
                          }
                          else if(deviceName == '' && cart2.deviceName != ''){
                            cart.getSpectrumData(cart2.deviceName);
                            setState(() {
                              spectrum = cart.spectrum_data;
                              print('spectrum:'+cart.spectrum_data);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text('取得資料',style: TextStyle(color: Colors.white),)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Consumer<spectrumData>(
                          builder: (context, cart, child){
                            return Text(cart.spectrum_data);
                          },
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: Text("備註： ",style: TextStyle(fontSize: 16),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          height: 2.0,
                        ),
                        // controller:controller2,
                        decoration: InputDecoration(hintText: '請輸入備註'),
                        keyboardType: TextInputType.multiline,
                        maxLength: null,
                        onChanged: (text){
                          pstext = text;
                        },

                      ),
                    )
                    ,

                  ],
                ),
                RaisedButton(
                    child: Text("儲存"),
                    onPressed: () async {
                      var sendTime = DateFormat("yyyy/MM/dd").format(selectDateTime) + "-" + DateFormat("HH:mm").format(DateFormat.jm().parse(selectTime.format(context)));
                      if(imgsrc == null){
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text("請拍攝或選擇相片"),duration: const Duration(milliseconds: 800),
                        // ));
                        Fluttertoast.showToast(
                            msg: "請拍攝或選擇相片",
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.black54,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      else{
                        var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/data/'+uid));
                        if(pstext == null){
                          pstext = "";
                        }
                        print("spectrum_before:"+cart.spectrum_data);
                        if(spectrum == null){
                          spectrum = '';
                        }
                        print("spectrum_after:"+cart.spectrum_data);
                        print('time:' + sendTime + ',ps:' + pstext + ',spectrum:' + cart.spectrum_data);
                        request.fields.addAll({
                          'time' : sendTime,
                          'ps' : pstext,
                          'spectrum' : cart.spectrum_data,
                        });
                        print("spectrum_post:"+cart.spectrum_data);
                        request.files.add(await http.MultipartFile.fromPath('stoolPic', imgsrc.path));
                        print(imgsrc.path);
                        print(pstext);
                        final response =  request.send();
                        // await new_diary(sendTime,controller10.text,imgsrc.path,uid);
                        print('done');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context){
                            return Home(userData: "",selectedIndex: 0,selectDate: DateTime.now(),);
                          }),
                              (Route<dynamic> route) => false,
                        );
                      }
                    }),
              ],
            ),
          ),
        )
    );
  }

  Widget NewDiaryDesktop(BuildContext context){
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    String uid;
    if(user != null)
    {
      uid = user.uid;
    }
    else
    {
      uid = "non";
    }
    var spectrum = "";
    final cart = Provider.of<spectrumData>(context,listen: false);
    final cart2 = Provider.of<user_data>(context,listen: false);
    cart.spectrum_data = '';
    FlutterBlue flutterBlue = FlutterBlue.instance;
    FlutterBluetoothSerial flutterBluetoothSerial = FlutterBluetoothSerial.instance;
    StreamSubscription<BluetoothDiscoveryResult>? streamSubscription;

    var deviceName = '';

    return Scaffold(
        body:SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text("時間：  ",style: TextStyle(fontSize: 20),textAlign: TextAlign.end,),
                    ),
                    ElevatedButton(
                      onPressed: ()async{
                        var result = await showDatePicker(
                            context: context,
                            initialDate: selectDateTime,
                            firstDate: DateTime(2020,01),
                            lastDate: DateTime.now()
                        );

                        if(result != null) {
                          setState(() {
                            selectDateTime = result;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                      child: Text(DateFormat("yyyy/MM/dd").format(selectDateTime),style: TextStyle(fontSize: 20,color: Colors.white),),
                    ),
                    ElevatedButton(
                        onPressed: ()async{
                          var selected = await showTimePicker(
                            context: context,
                            initialTime: selectTime,
                            builder: (context,child){
                              return MediaQuery(
                                data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                                child: child!,
                              );
                            },
                          );
                          if(selected != null){
                            setState(() {
                              selectTime = selected;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(selectTime.format(context),style: TextStyle(fontSize: 20,color: Colors.white),)
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Text("糞便相片： ",style: TextStyle(fontSize: 20),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: imageWeb(imgsrc),
                    ),
                    Column(
                      children: [
                        IconButton(
                            onPressed: ()async{
                              var image = await ImagePicker().getImage(source: ImageSource.gallery);
                              setState(() {
                                imgsrc = image;
                              });
                            },
                            icon: Icon(Icons.photo_album)),
                        Text("相簿"),
                      ],)

                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text("頻譜資料： ",style: TextStyle(fontSize: 20),textAlign: TextAlign.end,),

                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        textAlign: TextAlign.center,
                        initialValue: cart2.deviceName,
                        decoration: InputDecoration(hintText: '請輸入設備名稱',hintStyle: TextStyle(fontSize: 16)),
                        onChanged: (text){
                          deviceName = text;
                        },
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if(deviceName != ''){
                            cart.getSpectrumData(deviceName);
                            setState(() {
                              spectrum = cart.spectrum_data;
                              print("spectrum:"+cart.spectrum_data);
                            });
                          }
                          else if(deviceName == '' && cart2.deviceName != ''){
                            cart.getSpectrumData(cart2.deviceName);
                            setState(() {
                              spectrum = cart.spectrum_data;
                              print('spectrum:'+cart.spectrum_data);
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text('取得資料',style: TextStyle(fontSize: 16,color: Colors.white),)
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Consumer<spectrumData>(
                          builder: (context, cart, child){
                            return Text(cart.spectrum_data);
                          },
                        ),
                      ),
                    ),

                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      child: Text("備註： ",style: TextStyle(fontSize: 20),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      margin: EdgeInsets.symmetric(vertical: 3.0),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18,
                          height: 2.0,
                        ),
                        // controller:controller2,
                        decoration: InputDecoration(hintText: '請輸入備註'),
                        keyboardType: TextInputType.multiline,
                        maxLength: null,
                        onChanged: (text){
                          pstext = text;
                        },

                      ),
                    )
                    ,

                  ],
                ),
                RaisedButton(
                    child: Text("儲存"),
                    onPressed: () async {
                      var sendTime = DateFormat("yyyy/MM/dd").format(selectDateTime) + "-" + DateFormat("HH:mm").format(DateFormat.jm().parse(selectTime.format(context)));
                      if(imgsrc == null){
                        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //   content: Text("請拍攝或選擇相片"),duration: const Duration(milliseconds: 800),
                        // ));
                        Fluttertoast.showToast(
                            msg: "請選擇相片",
                            toastLength: Toast.LENGTH_LONG,
                            timeInSecForIosWeb: 2,
                            backgroundColor: Colors.black45,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                      else{
                        var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/data/'+uid));
                        if(pstext == null){
                          pstext = "";
                        }
                        print("spectrum_before:"+cart.spectrum_data);
                        if(spectrum == null){
                          spectrum = '';
                        }
                        print("spectrum_after:"+cart.spectrum_data);
                        print('time:' + sendTime + ',ps:' + pstext + ',spectrum:' + cart.spectrum_data);
                        request.fields.addAll({
                          'time' : sendTime,
                          'ps' : pstext,
                          'spectrum' : cart.spectrum_data,
                        });
                        print("spectrum_post:"+cart.spectrum_data);
                        request.files.add(await http.MultipartFile.fromPath('stoolPic', imgsrc.path));
                        print(imgsrc.path);
                        print(pstext);
                        final response =  request.send();
                        // await new_diary(sendTime,controller10.text,imgsrc.path,uid);
                        print('done');
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context){
                            return Home(userData: "",selectedIndex: 0,selectDate: DateTime.now(),);
                          }),
                              (Route<dynamic> route) => false,
                        );
                      }
                    }),
              ],
            ),
          ),
        )
    );
  }
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScreenTypeLayout(
        mobile: NewDiaryMobile(context),
      desktop: NewDiaryDesktop(context),
    );
  }
  Widget imageView(imgpath){
    if(imgpath == null){
      return Center(
        child: Text("請選擇相片或拍照"),
      );
    }
    else{
      return Image.file(File(imgpath.path));
      // return Text('選擇照片(mobile)');
    }
  }

  Widget imageWeb(imgpath){
    if(imgpath == null){
      return Center(
        child: Text("請選擇相片"),
      );
    }
    else{
      // return Text(imgpath.path.split('/').last);
      return Text('已選擇照片');
    }
  }

}