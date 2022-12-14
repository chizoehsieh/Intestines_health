

import 'dart:convert';
// import 'dart:html';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:test1/home.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:provider/provider.dart';
import 'package:test1/provider/user_data.dart';
import '../controllers/navigation.dart';
import 'package:test1/provider/const.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';

// class MyAPP extends StatefulWidget{
//   SignUpPage createState()=>  SignUpPage();
// }

class SignUp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:SignUpPage(title: "SignUp")
    );

  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _SignUpPage createState() => _SignUpPage();
}

class _SignUpPage extends State {

  late NavigationController navigation;
  // FirebaseApp firebaseApp = Firebase.initializeApp() as FirebaseApp;
  // FirebaseAuth auth;
  late FirebaseAuth auth;
  // FirebaseAuth auth = FirebaseAuth.instanceFor(app: firebaseApp);

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  TextEditingController controller5 = new TextEditingController();
  @override
  var sex = null;

  void _onValueChanged(String newValue)
  {
    sex = newValue;
  }
  var name = '',age = '',height = '',weight = '',deviceName = '',birthDate = '???????????????';

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  Widget build(BuildContext context) {
    final cart = context.read<constData>();
    Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    // var httpClient = new HttpClient();

    print('rebuild-------');
    setPageTitle('??????', context);

    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("??????????????????"),
          leading: Icon(MyFlutterApp.blood),
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
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              //   content: Text(error.toString()),duration: const Duration(milliseconds: 800),
              // ));
              Fluttertoast.showToast(
                  msg: error.toString(),
                  toastLength: Toast.LENGTH_LONG,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black45,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          },)],
        ),
        body: Center(
          // child: Text('Login Form', style: TextStyle(fontSize: 40),),
            child:Column(
              children: [
                DropdownButton(
                  items: <DropdownMenuItem<String>>[
                    DropdownMenuItem(child: Text("??????"),value: "??????",),
                    DropdownMenuItem(child: Text("??????"),value: "??????",),
                    DropdownMenuItem(child: Text("??????"),value: "??????",),
                  ],
                  hint: new Text("???????????????"),
                  isExpanded: true,
                  value:sex,
                  onChanged: (Object? data){
                    print(data);
                    setState(() {
                      sex = data.toString();
                      print('sex:'+sex);
                    });
                  },
                ),
                TextFormField(
                  initialValue: name,
                  decoration: InputDecoration(hintText: '???????????????'),
                  onChanged: (text){
                    name = text;
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: ElevatedButton(
                    onPressed: ()async{
                      var result = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900,01),
                          lastDate: DateTime.now()
                      );

                      if(result != null) {
                        setState(() {
                          birthDate = DateFormat("yyyy/MM/dd").format(result);
                          print('birthdate: ' + birthDate);
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.blueGrey),
                    child: Text(birthDate,style: TextStyle(fontSize: 24,color: Colors.white),),
                  ),
                ),
                // TextFormField(
                //   initialValue: age,
                //   decoration: InputDecoration(hintText: '???????????????') ,
                //   keyboardType: TextInputType.number,
                //   onChanged: (text){
                //     age = text;
                //   },
                //
                // ),
                // TextField(
                //   controller: controller3,
                //   decoration: InputDecoration(hintText: "???????????????(F/M)"),
                // ),

                // DropdownButton(
                //     items: <DropdownMenuItem<String>>[
                //       DropdownMenuItem(child: Text("Male"),value: "Male",),
                //       DropdownMenuItem(child: Text("Female"),value: "Female",),
                //       DropdownMenuItem(child: Text("Else"),value: "Else",),
                //     ],
                //     hint: new Text("???????????????"),
                //     isExpanded: true,
                //     value:cart.sex,
                //   onChanged: (Object? data){
                //       cart.writeSex(data.toString());
                //       print('data:');
                //       print(data);
                //   },
                // ),

                TextFormField(
                  initialValue: height,
                  decoration: InputDecoration(hintText: "???????????????"),
                  keyboardType: TextInputType.number,
                  onChanged: (text){
                    height = text;
                  },
                ),
                TextFormField(
                  initialValue: weight,
                  decoration: InputDecoration(hintText: "???????????????"),
                  keyboardType: TextInputType.number,
                  onChanged: (text){
                    weight = text;
                  },
                ),
                TextFormField(
                  initialValue: deviceName,
                  decoration: InputDecoration(hintText: "??????????????????????????????"),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (text){
                    deviceName = text;
                  },
                ),
                Row(
                  children: [

                    RaisedButton(
                        child: Text('??????'),
                        onPressed: () async {
                          print('??????:'+name+age+height+weight+sex);
                          if(name == '')
                          {
                            // Fluttertoast.showToast(msg: "???????????????",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                            ));
                          }
                          else if(birthDate == '???????????????')
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                            ));
                          }
                          // else if(controller3.text == "")
                          // {
                          //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //     content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                          //   ));
                          // }
                          else if(height == '')
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                            ));
                          }
                          else if(weight == '')
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                            ));
                          }
                          else if(sex == ''){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("???????????????"),duration: const Duration(milliseconds: 800),
                            ));
                          }
                          else
                          {
                            if(user != null)
                            {
                              // var request = httpClient.getUrl(Uri.http('http://127.0.0.1:5000/signup/'+user.uid+'/'+controller1.text+'/'+controller2.text+'/'+controller4.text+'/'+controller5.text+'/'+controller3.text, unencodedPath))
                              String url = ('http://127.0.0.1:5000/signup/'+user.uid+'/'+controller1.text+'/'+controller2.text+'/'+controller4.text+'/'+controller5.text+'/'+sex);

                              try
                              {
                                // var uri = Uri.http('10.0.2.2:5000', '/signup/'+user.uid+'/'+controller1.text+'/'+controller2.text+'/'+controller4.text+'/'+controller5.text+'/'+sex);
                                // var request = await httpClient.getUrl(uri);
                                // var response = await request.close();
                                // var uri2 = Uri.http('10.0.2.2:5000', '/member_search/'+user.uid);
                                // // var httpClient = new HttpClient();
                                // var request2 = await httpClient.getUrl(uri2);
                                // var response2 = await request2.close();
                                // name = cart.name;
                                // age = cart.age;
                                // height = cart.height;
                                // weight = cart.weight;
                                // sex = cart.sex;
                                if(deviceName == ''){
                                  deviceName == '';
                                }
                                print('userPost:'+name+birthDate+height+weight+sex+deviceName);
                                var request = http.MultipartRequest('POST',Uri.parse('http://203.145.206.20:5000' + '/member/'+user.uid));
                                request.fields.addAll({
                                  'name' : name,
                                  'birth' : birthDate,
                                  'height' : height,
                                  'weight' : weight,
                                  'sex' : sex,
                                  'camID':deviceName
                                });

                                // print(controller1.text+controller2.text+controller4.text+controller5.text+sex);
                                // final response =  request.send();
                                http.StreamedResponse response = await request.send();
                                final cart2 = Provider.of<user_data>(context,listen: false);
                                cart2.count = 0;
                                Navigator.of(context).pop();
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return Home(userData: '', selectedIndex: 0,selectDate: DateTime.now(),);
                                  }),
                                  (Route<dynamic> route) => false,
                                );

                                // HttpClientRequest request = httpClient.postUrl(Uri.parse(url)) as HttpClientRequest;
                                // HttpClientResponse response = request.close() as HttpClientResponse;
                                // String body = response.transform(utf8.decoder).join() as String;
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Text(body),duration: const Duration(milliseconds: 2000),
                                // ));
                              }catch(error)
                              {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                  content: Text((error).toString()),duration: const Duration(milliseconds: 800),
                                ));
                                print('error'+error.toString());
                              }
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(builder: (context){
                              //     return Home(userData: user.uid + "\t" + controller1.text + "\t" + controller2.text + '\t' + controller4.text + '\t' + controller5.text + '\t' + sex,);
                              //   }),);

                            }

                          }

                        }
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                )

              ],
            )


        )

    );
  }
  // signInEvent(BuildContext context){
  //   if(controller1.text == "")
  //   {
  //     Fluttertoast.showToast(msg: "???????????????",toastLength: Toast.LENGTH_LONG);
  //   }
  //   else if(controller2.text == "")
  //   {
  //     print("???????????????");
  //   }
  //   // else
  //   //   {
  //   //     auth.signInWithEmailAndPassword(email: controller1.text, password: controller2.text);
  //   //   }
  //   // Navigator(pages: [MaterialPage(child: Home())],onPopPage: (route,result){
  //   //   return route.didPop(result);
  //   // },);
  //   // navigation.changScreen('home');
  //   print(controller1.text+'????????????');
  // }
  // signUpEvent(BuildContext context){
  //   if(controller1.text == "")
  //   {
  //     print("???????????????");
  //   }
  //   else if(controller2.text == "")
  //   {
  //     print("???????????????");
  //   }
  //   else
  //   {
  //     try{
  //       auth.createUserWithEmailAndPassword(email: controller1.text, password: controller2.text);
  //       Navigator(pages: [MaterialPage(child: Home())],onPopPage: (route,result){
  //         return route.didPop(result);
  //       },);
  //     }on FirebaseAuthException catch(e){
  //       print(e);
  //     }
  //   }
  //   Navigator(pages: [MaterialPage(child: Home())],onPopPage: (route,result){
  //     return route.didPop(result);
  //   },);
  //   print(controller1.text+"????????????");
  // }
  // void initState(BuildContext context){  //oncreate
  //   // Firebase.initializeApp();
  //   // auth = FirebaseAuth.instance;
  //   // User user = auth.currentUser;
  //   // if(user == null)
  //   // {
  //   //
  //   // }
  //   // else
  //   //   {
  //   //
  //   //   }
  //   FirebaseAuth.instance.idTokenChanges().listen((User?user) {
  //     if(user != null) {
  //       Navigator(pages: [MaterialPage(child: Home())],onPopPage: (route,result){
  //         return route.didPop(result);
  //       },);
  //     }
  //   });
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //     content: Text("????????????"),duration: const Duration(milliseconds: 800),
  //   ));
  // }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


}

