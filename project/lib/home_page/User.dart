import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/provider/user_data.dart';
import 'package:test1/home.dart';
import 'package:test1/sign_up.dart';
import 'package:responsive_builder/responsive_builder.dart';

String userData = "";

class UserPage extends StatelessWidget{
  const UserPage({Key? key, required userData}) : super(key: key);
  @override



  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        body:TheUserPage()
    );
  }
  
}

class TheUserPage extends StatefulWidget{
  @override
  State<TheUserPage> createState() => _TheUserPage();
}

class _TheUserPage extends State<TheUserPage>{
  var weight;
  var height;
  var age;
  var name;
  var sex;
  var deviceName;
  var birthDate;

  Widget UserMobile(BuildContext context){
    final cart = Provider.of<user_data>(context,listen: false);
    cart.getUserData();
    for(int i=0;i<10000000;i++){

    }
    if(cart.state == 0){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context){
          return SignUp();
        }),
            (Route<dynamic> route) => false,
      );
    }
    print("count:" + (cart.count).toString());
    print("done");
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
    if(cart.count == 0)
    {
      cart.getUserData();
    }
    String n_ini = cart.name;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("暱稱：  ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: n_ini,
                        decoration: InputDecoration(hintText: '請輸入暱稱'),
                        onChanged: (text){
                          name = text;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("生日： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: ()async{
                          var result = await showDatePicker(
                              context: context,
                              initialDate: cart.birth,
                              firstDate: DateTime(1900,01),
                              lastDate: DateTime.now()
                          );

                          if(result != null) {
                            setState(() {
                              cart.birth = result;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(DateFormat("yyyy/MM/dd").format(cart.birth),style: TextStyle(color: Colors.white),),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("性別： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Text(cart.sex,style: TextStyle(fontSize: 22,height: 2.0),),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("身高： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.height,
                        decoration: InputDecoration(hintText: '請輸入身高'),
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          height = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("體重： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.weight,
                        decoration: InputDecoration(hintText: '請輸入體重'),
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          weight = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("設備名稱： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.deviceName,
                        decoration: InputDecoration(hintText: '請輸入欲綁定設備名稱'),
                        onChanged: (text){
                          deviceName = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Text("",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,)
                  ],
                ),
                RaisedButton(
                    child: Text("儲存"),
                    onPressed: () async {
                      sex = cart.sex;
                      if(name == null)
                      {
                        // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                        name = cart.name;
                      }
                      if(age == null)
                      {
                        age = cart.age;
                      }
                      if(height == null)
                      {
                        height = cart.height;
                      }
                      if(weight == null)
                      {
                        weight = cart.weight;
                      }
                      if(deviceName == null){
                        deviceName = cart.deviceName;
                      }
                      print("n:"+name);
                      print("a:"+age);
                      print("h:"+height);
                      print("w:"+weight);
                      print("s:"+sex);
                      var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/member/'+ uid));
                      request.fields.addAll({
                        'name' : name,
                        'height' : height,
                        'weight' : weight,
                        'sex' : sex,
                        'birth' : DateFormat("yyyy/MM/dd").format(cart.birth),
                        'camID':deviceName,
                      });


                      final response =  request.send();
                      print("update-----");
                      cart.count = 0;
                      cart.getUserData();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context){
                          return Home(userData: "",selectedIndex: 0,selectDate: DateTime.now(),);
                        }),
                            (Route<dynamic> route) => false,
                      );
                    }),
                RaisedButton(
                    child: Text("登出"),
                    onPressed: (){
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
                    }),
                RaisedButton(
                    child: Text("刪除帳號"),
                    onPressed: (){

                      AlertDialog dialog = AlertDialog(
                        title: Text("確定刪除帳號？"),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("否")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                try{
                                  var request = http.MultipartRequest('DELETE',Uri.parse('http://203.145.206.20:5000' + '/member/' + uid));
                                  user?.delete();
                                  final response =  request.send();
                                  for(int i=0;i<1055000000;i++){

                                  }
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
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
                              },
                              child: Text("確認刪除"))
                        ],
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

                    })
              ],
            ),
          ),
        )

    );
  }

  Widget UserDesktop(BuildContext context){
    final cart = Provider.of<user_data>(context,listen: false);
    cart.getUserData();
    for(int i=0;i<10000000;i++){

    }
    if(cart.state == 0){
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context){
          return SignUp();
        }),
            (Route<dynamic> route) => false,
      );
    }
    print("count:" + (cart.count).toString());
    print("done");
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
    if(cart.count == 0)
    {
      cart.getUserData();
    }
    String n_ini = cart.name;
    return  Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("暱稱：  ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: n_ini,
                        decoration: InputDecoration(hintText: '請輸入暱稱'),
                        onChanged: (text){
                          name = text;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("生日： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: ElevatedButton(
                        onPressed: ()async{
                          var result = await showDatePicker(
                              context: context,
                              initialDate: cart.birth,
                              firstDate: DateTime(1900,01),
                              lastDate: DateTime.now()
                          );

                          if(result != null) {
                            setState(() {
                              cart.birth = result;
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                        child: Text(DateFormat("yyyy/MM/dd").format(cart.birth),style: TextStyle(fontSize: 24,color: Colors.white),),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("性別： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Text(cart.sex,style: TextStyle(fontSize: 22,height: 2.0),),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("身高： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.height,
                        decoration: InputDecoration(hintText: '請輸入身高'),
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          height = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("體重： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.weight,
                        decoration: InputDecoration(hintText: '請輸入體重'),
                        keyboardType: TextInputType.number,
                        onChanged: (text){
                          weight = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text("設備名稱： ",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 22,
                          height: 2.0,
                        ),
                        initialValue: cart.deviceName,
                        decoration: InputDecoration(hintText: '請輸入欲綁定設備名稱'),
                        onChanged: (text){
                          deviceName = text;
                        },
                      ),
                    )
                    ,
                  ],
                ),
                Row(
                  children: [
                    Text("",style: TextStyle(fontSize: 24),textAlign: TextAlign.end,)
                  ],
                ),
                RaisedButton(
                    child: Text("儲存",style: TextStyle(fontSize: 24),),
                    onPressed: () async {
                      sex = cart.sex;
                      if(name == null)
                      {
                        // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                        name = cart.name;
                      }
                      if(age == null)
                      {
                        age = cart.age;
                      }
                      if(height == null)
                      {
                        height = cart.height;
                      }
                      if(weight == null)
                      {
                        weight = cart.weight;
                      }
                      if(deviceName == null){
                        deviceName = cart.deviceName;
                      }
                      print("n:"+name);
                      print("a:"+age);
                      print("h:"+height);
                      print("w:"+weight);
                      print("s:"+sex);
                      var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/member/'+ uid));
                      request.fields.addAll({
                        'name' : name,
                        'height' : height,
                        'weight' : weight,
                        'sex' : sex,
                        'birth' : DateFormat("yyyy/MM/dd").format(cart.birth),
                        'camID':deviceName,
                      });


                      final response =  request.send();
                      print("update-----");
                      cart.count = 0;
                      cart.getUserData();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context){
                          return Home(userData: "",selectedIndex: 0,selectDate: DateTime.now(),);
                        }),
                            (Route<dynamic> route) => false,
                      );
                    }),
                Text(''),
                RaisedButton(
                    child: Text("登出",style: TextStyle(fontSize: 24),),
                    onPressed: (){
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
                    }),
                Text(''),
                RaisedButton(
                    child: Text("刪除帳號",style: TextStyle(fontSize: 24),),
                    onPressed: (){

                      AlertDialog dialog = AlertDialog(
                        title: Text("確定刪除帳號？"),
                        actions: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                              child: Text("否")
                          ),
                          ElevatedButton(
                              onPressed: (){
                                try{
                                  var request = http.MultipartRequest('DELETE',Uri.parse('http://203.145.206.20:5000' + '/member/' + uid));
                                  user?.delete();
                                  final response =  request.send();
                                  for(int i=0;i<1055000000;i++){

                                  }
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
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
                              },
                              child: Text("確認刪除"))
                        ],
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

                    })
              ],
            ),
          ),
        )

    );
  }

  // Object? get result => null;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return ScreenTypeLayout(
      mobile: UserMobile(context),
      desktop: UserDesktop(context),
    );

  }

}