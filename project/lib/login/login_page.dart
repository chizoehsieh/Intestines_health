

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:test1/home.dart';
import 'package:test1/sign_up.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/provider/user_data.dart';
import 'package:provider/provider.dart';
import '../controllers/navigation.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {

  late NavigationController navigation;
  // FirebaseApp firebaseApp = Firebase.initializeApp() as FirebaseApp;
  // FirebaseAuth auth;
  late FirebaseAuth auth;
  // FirebaseAuth auth = FirebaseAuth.instanceFor(app: firebaseApp);

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value, // This line is required
    ));
  }



  @override
  Widget build(BuildContext context) {
    // navigation = Provider.of<NavigationController>(context,listen: false);
    // return FutureBuilder(builder: future:Fi)
    Firebase.initializeApp();
    auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if( user != null){
      final cart = Provider.of<user_data>(context,listen: false);
      // cart.count = 0;
      // cart.getUserData();
      print('state:'+cart.state.toString());
      if(cart.state == 0){
        return SignUp();
      }
      else{
        return Home(userData: '',selectedIndex: 0,selectDate: DateTime.now(),);
      }


    }
    else{
      final cart = Provider.of<user_data>(context,listen: false);
      cart.count = 0;
      var account = '',code = '';
      setPageTitle('登入', context);
      return Scaffold(
          appBar: AppBar(
            // Here we take the value from the MyHomePage object that was created by
            // the App.build method, and use it to set our appbar title.
            title: Text("登入頁"),
            leading: Icon(MyFlutterApp.blood),
          ),
          body: Center(
            // child: Text('Login Form', style: TextStyle(fontSize: 40),),
              child:Column(
                children: [
                  TextField(

                    decoration: InputDecoration(hintText: '請輸入帳號'),
                    keyboardType: TextInputType.visiblePassword,
                    autocorrect: false,
                    onChanged: (text){
                      account = text;
                    },
                  ),
                  TextField(

                    decoration: InputDecoration(hintText: '請輸入密碼') ,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    onChanged: (text){
                      code = text;
                    },
                    onSubmitted: (value) async{

                      if (account == "" || account == null) {
                        // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("請輸入帳號"), duration: const Duration(milliseconds: 800),
                        ));
                      }
                      else if (code == "" || code == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("請輸入密碼"), duration: const Duration(milliseconds: 800),
                        ));
                      }
                      else {
                        String stringData = "";
                        try {
                          User? user = (await auth.signInWithEmailAndPassword(
                            email: account, password: code,)).user;
                          if (user != null) {
                            print('user');
                            final cart = Provider.of<user_data>(context, listen: false);
                            cart.count = 0;
                            var response = await http.get(
                                Uri.parse('http://203.145.206.20:5000' + '/member/' + user.uid));
                            print('response');
                            var body = json.decode(response.body);
                            if (body["status"] == 0) {
                              print('body');
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return SignUp();
                                }),
                                    (Route<dynamic> route) => false,
                              );
                            }
                            else {
                              print('else');
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) {
                                  return Home(
                                    userData: "", selectedIndex: 0, selectDate: DateTime.now(),);
                                }),
                                    (Route<dynamic> route) => false,
                              );
                            }
                            print('end');
                          }
                        } on FirebaseAuthException catch (e) {
                          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          //   content: Text("登入失敗"),duration: const Duration(milliseconds: 800),
                          // ));
                          Fluttertoast.showToast(
                              msg: "登入失敗",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.black45,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      }
                    },
                  ),
                  Row(
                    children: [
                      RaisedButton(
                          child: Text('註冊'),
                          onPressed: () async {
                            if(account == "" || account == null)
                            {
                              // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("請輸入帳號"),duration: const Duration(milliseconds: 800),
                              ));
                            }
                            else if(code == "" || code == null)
                            {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("請輸入密碼"),duration: const Duration(milliseconds: 800),
                              ));
                            }
                            else
                            {
                              try {
                                User? user = (await auth
                                    .signInWithEmailAndPassword(
                                  email: account, password: code,)).user;
                                if (user != null) {
                                  print('user');
                                  print(FirebaseAuth.instance.currentUser?.uid);
                                  final cart = Provider.of<user_data>(
                                      context, listen: false);
                                  cart.count = 0;
                                  var response = await http.get(Uri.parse(
                                      'http://203.145.206.20:5000' +
                                          '/member/' + user.uid));
                                  print('response');
                                  var body = json.decode(response.body);
                                  if (body["status"] == 0) {
                                    print('body');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return SignUp();
                                      }),
                                          (Route<dynamic> route) => false,
                                    );
                                  }
                                }
                              }
                              catch(e){
                                print(e);
                              }
                              try{
                                auth.createUserWithEmailAndPassword(email: account, password: code);
                                // Navigator(pages: [MaterialPage(child: SignUpPage())],onPopPage: (route,result){
                                //   return route.didPop(result);
                                //
                                // },);
                                final cart = Provider.of<user_data>(context,listen: false);
                                cart.count = 0;
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(builder: (context){
                                    return SignUp();
                                  }),
                                  (Route<dynamic> route) => false,
                                );
                              }on FirebaseAuthException catch(e){
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Text("註冊失敗"),duration: const Duration(milliseconds: 800),
                                // ));
                                Fluttertoast.showToast(
                                    msg: "註冊失敗",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.black45,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
                              }


                            }
                          }
                      ),
                      RaisedButton(
                          child: Text('登入'),
                          onPressed: () async {

                            if (account == "" || account == null) {
                              // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("請輸入帳號"), duration: const Duration(milliseconds: 800),
                              ));
                            }
                            else if (code == "" || code == null) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text("請輸入密碼"), duration: const Duration(milliseconds: 800),
                              ));
                            }
                            else {
                              String stringData = "";
                              try {
                                User? user = (await auth.signInWithEmailAndPassword(
                                  email: account, password: code,)).user;
                                if (user != null) {
                                  print('user');
                                  final cart = Provider.of<user_data>(context, listen: false);
                                  cart.count = 0;
                                  var response = await http.get(
                                      Uri.parse('http://203.145.206.20:5000' + '/member/' + user.uid));
                                  print('response');
                                  var body = json.decode(response.body);
                                  if (body["status"] == 0) {
                                    print('body');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return SignUp();
                                      }),
                                          (Route<dynamic> route) => false,
                                    );
                                  }
                                  else {
                                    print('else');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return Home(
                                          userData: "", selectedIndex: 0, selectDate: DateTime.now(),);
                                      }),
                                          (Route<dynamic> route) => false,
                                    );
                                  }
                                  print('end');
                                }
                              } on FirebaseAuthException catch (e) {
                                // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                //   content: Text("登入失敗"),duration: const Duration(milliseconds: 800),
                                // ));
                                Fluttertoast.showToast(
                                    msg: "登入失敗",
                                    toastLength: Toast.LENGTH_LONG,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 2,
                                    backgroundColor: Colors.black45,
                                    textColor: Colors.white,
                                    fontSize: 16.0
                                );
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

  }
   signInEvent(BuildContext context,String account,String code) async {
     if (account == "" || account == null) {
       // Fluttertoast.showToast(msg: "請輸入帳號",toastLength: Toast.LENGTH_SHORT,backgroundColor: Colors.black,textColor: Colors.white);
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("請輸入帳號"), duration: const Duration(milliseconds: 800),
       ));
     }
     else if (code == "" || code == null) {
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         content: Text("請輸入密碼"), duration: const Duration(milliseconds: 800),
       ));
     }
     else {
       String stringData = "";
       try {
         User? user = (await auth.signInWithEmailAndPassword(
           email: account, password: code,)).user;
         if (user != null) {
           print('user');
           final cart = Provider.of<user_data>(context, listen: false);
           cart.count = 0;
           var response = await http.get(
               Uri.parse('http://203.145.206.20:5000' + '/member/' + user.uid));
           print('response');
           var body = json.decode(response.body);
           if (body["status"] == 0) {
             print('body');
             Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(builder: (context) {
                 return SignUp();
               }),
                   (Route<dynamic> route) => false,
             );
           }
           else {
             print('else');
             Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(builder: (context) {
                 return Home(
                   userData: "", selectedIndex: 0, selectDate: DateTime.now(),);
               }),
                   (Route<dynamic> route) => false,
             );
           }
           print('end');
         }
       } on FirebaseAuthException catch (e) {
         // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
         //   content: Text("登入失敗"),duration: const Duration(milliseconds: 800),
         // ));
         Fluttertoast.showToast(
             msg: "登入失敗",
             toastLength: Toast.LENGTH_LONG,
             gravity: ToastGravity.CENTER,
             timeInSecForIosWeb: 2,
             backgroundColor: Colors.black45,
             textColor: Colors.white,
             fontSize: 16.0
         );
       }
     }
   }

}

