import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/home_page/User.dart';
import 'package:test1/login/login_page.dart';
import 'package:test1/home_page/newDiary.dart';
import 'package:test1/provider/user_data.dart';
import 'package:test1/home_page/diary.dart';
import 'package:test1/provider/old_diary.dart';
import 'package:test1/provider/calender.dart';
import 'package:test1/home_page/home_page.dart';
import 'package:intl/intl.dart';
import 'package:test1/home_page/information.dart';
import 'package:test1/sign_up.dart';

String userData = "";
class Home extends StatelessWidget {
  Home({Key? key, required userData,required this.selectedIndex,required this.selectDate}) : super(key: key);
  @override
  int selectedIndex;
  DateTime selectDate;

  Widget build(BuildContext context) {

    return Scaffold(
      body:MyHomePage(title: "Home",selectedIndex: selectedIndex,selectDate: selectDate,)
      );

  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title,required this.selectedIndex,required this.selectDate}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  int selectedIndex;
  DateTime selectDate;
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState(selectedIndex: selectedIndex,selectDate: selectDate);
}
int _selectIndex = 0;
DateTime _selectDate = DateTime.now();
class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState({required this.selectedIndex,required this.selectDate});
  int selectedIndex;
  DateTime selectDate;
  int _counter = 0;
  final _selectedItemColor = Colors.white24;
  final _unSelectedItemColor = Colors.black;
  final _selectedBackgroundColor = Colors.indigo;
  final _unSelectedBackgroundColor = Colors.cyan;
  static const List<Widget> _widgetOption = <Widget> [
    Icon(MyFlutterApp.home,size: 200,),
    Icon(MyFlutterApp.book,size: 200,),
    Icon(MyFlutterApp.plus,size: 200,),
    Icon(MyFlutterApp.exclamation,size: 200,),
    Icon(MyFlutterApp.user,size: 200,),
  ];

  void initState(){
    setState(() {
      _selectIndex = selectedIndex;
      _selectDate = selectDate;
    });
  }

  void SelectIndex(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  Widget pages(int index){
    switch(index){
      case 0:
        _selectDate = DateTime.now();
        return HomePage();
      case 1:
        _selectDate = DateTime.now();
        return DiaryPage(startTime: DateTime.now().subtract(Duration(days: 30)),endTime: DateTime.now(),);
      case 2:
        return NewDiaryPage(selectedDate: _selectDate,);
      case 3:
        _selectDate = DateTime.now();
        return informationPage();
      case 4:
        _selectDate = DateTime.now();
        return UserPage(userData: userData);
      default:
        _selectDate = DateTime.now();
        return _widgetOption.elementAt(index);
    }
  }

  void _onItemTap(int index)
  {
    setState(() => _selectIndex = index);
  }

  Color _getBackgroundColor(int index)
  {
    if(_selectIndex == index)
    {
      return _selectedBackgroundColor;
    }
    else
    {
      return _unSelectedBackgroundColor;
    }
  }

  Color _getItemColor(int index)
  {
    if(_selectIndex == index)
    {
      return _selectedItemColor;
    }
    else
    {
      return _unSelectedItemColor;
    }
  }

  String _screenText(int index)
 {
    switch(index)
    {
      case 0:
        return "首頁";
        break;
      case 1:
        return "歷史資料";
        break;
      case 2:
        return "新增資料";
        break;
      case 3:
        return "資訊";
        break;
      case 4:
        return "會員";
        break;
    }
    return "首頁";
  }

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  Widget _buildIcon(IconData iconData, String text, int index) => Container(
    width: double.infinity,
    height: kBottomNavigationBarHeight,
    child: Material(
      color: _getBackgroundColor(index),
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(iconData),
            Text(text,
                style: TextStyle(fontSize: 12, color: _getItemColor(index))),
          ],
        ),
        onTap: () => _onItemTap(index),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<user_data>(context);
    final cart2 = Provider.of<old_diary>(context,listen: false);
    final cart3 = Provider.of<home_data>(context);
    cart2.getResult(DateTime.now().subtract(Duration(days: 30)), DateTime.now());
    cart3.getHomeData(DateFormat('yyyy').format(DateTime.now()), DateFormat('MM').format(DateTime.now()));
    print("Width:"+MediaQuery.of(context).size.width.toString());
    if(cart.count == 0)
    {
      print("change------");
      cart.getUserData();
    }
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
    setPageTitle(_screenText(_selectIndex), context);

    return Scaffold(
        appBar: AppBar(
          title: Text(_screenText(_selectIndex)),
          leading: Icon(MyFlutterApp.blood),
          actions:<Widget> [IconButton(icon: Icon(MyFlutterApp.sign_out),onPressed:
              (){
            try{
              auth.signOut();
              for(int i=0;i<1058000000;i++){

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
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.home),label:"首頁"),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.book),label: "歷史資料"),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.plus),label: "新增資料"),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.exclamation),label: "資訊"),
          BottomNavigationBarItem(icon: Icon(MyFlutterApp.user),label: "會員")],
          onTap: _onItemTap,
          currentIndex: _selectIndex,
          backgroundColor: Colors.cyan,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.deepPurple,
          type: BottomNavigationBarType.fixed,),
        body: Center(child: pages(_selectIndex))
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Invoke "debug painting" (press "p" in the console, choose the
      //     // "Toggle Debug Paint" action from the Flutter Inspector in Android
      //     // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      //     // to see the wireframe for each widget.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headline4,
      //       ),
      //     ],
      //   ),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}