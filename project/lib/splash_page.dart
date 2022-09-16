import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive_splash_screen/rive_splash_screen.dart';
import 'package:test1/provider/user_data.dart';
import 'login/login_page.dart';
import 'package:test1/provider/const.dart';
import 'home.dart';
import 'package:provider/provider.dart';
import '../controllers/navigation.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}



class _SplashPageState extends State<SplashPage> {

  void setPageTitle(String title, BuildContext context) {
    SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
      label: title,
      primaryColor: Theme.of(context).primaryColor.value, // This line is required
    ));
  }

  @override
  Widget build(BuildContext context) {
    final cart2 = Provider.of<user_data>(context);
    cart2.count = 0;
    cart2.getUserData();
    final cart = context.read<constData>();
    cart.name = null;
    cart.age = null;
    cart.sex = null;
    cart.height = null;
    cart.weight = null;
    setPageTitle('opening', context);
    return SplashScreen.navigate(
      name: 'assets/opening.riv', // flr動畫檔路徑
      next: (context) => LoginPage(), // 動畫結束後轉換頁面
      until: () => Future.delayed(Duration(seconds: 1)), //等待3秒
      startAnimation: 'opening', // 動畫名稱
    );
  }
}