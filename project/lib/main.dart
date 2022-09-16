import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test1/calendar/Activity.dart';
import 'package:test1/my_flutter_app_icons.dart';
import 'package:test1/provider/calender.dart';
import 'package:test1/provider/old_diary.dart';
import 'package:test1/splash_page.dart';
import 'package:test1/provider/user_data.dart';
import 'package:test1/provider/spectrum.dart';
import 'package:test1/provider/const.dart';
import 'package:test1/provider/new_diary.dart';
import 'splash_page.dart';
import 'controllers/navigation.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await hiveInitialize();
  runApp(MyApp());
}

Future<void> hiveInitialize() async{
  await Hive.initFlutter();
  Hive.registerAdapter<Activity>(ActivityAdapter());
  await Hive.openBox<Activity>(activityBoxName);
  Hive.box<Activity>(activityBoxName).clear();
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: user_data()),
          ChangeNotifierProvider.value(value: old_diary()),
          ChangeNotifierProvider.value(value: home_data()),
          ChangeNotifierProvider.value(value: spectrumData()),
          ChangeNotifierProvider.value(value: constData()),
        ],
        child: MaterialApp(
          title: 'Flutter Test 1',
          theme: ThemeData(
            primarySwatch: Colors.cyan,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashPage(),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectIndex = 0;
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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Home"),
        leading: Icon(MyFlutterApp.blood),
        actions:<Widget> [IconButton(icon: Icon(MyFlutterApp.account),onPressed: null,)],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [BottomNavigationBarItem(icon: Icon(MyFlutterApp.home),label: "Home"),
                                                        BottomNavigationBarItem(icon: Icon(MyFlutterApp.book),label: "Diary"),
                                                        BottomNavigationBarItem(icon: Icon(MyFlutterApp.plus),label: "New"),
                                                        BottomNavigationBarItem(icon: Icon(MyFlutterApp.exclamation),label: "Information"),
                                                        BottomNavigationBarItem(icon: Icon(MyFlutterApp.user),label: "User")],
        onTap: _onItemTap,
        currentIndex: _selectIndex,
        backgroundColor: Colors.cyan,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,),
      body: Center(child: _widgetOption.elementAt(_selectIndex),)
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
