import 'package:get/get.dart';
import 'package:textrade/Common/Utilies.dart';
import 'package:textrade/HomeScreen/HomeScreen.dart';
import 'package:textrade/LoginScreen/LoginScreen.dart';
import 'package:textrade/SplashScreen/SplashScreen.dart';

class Routes {
  static var shared = Routes();

  List<GetPage<dynamic>>? pages = [
    GetPage(
        name: Utility.screenName(Screens.splash), page: () => SplashScreen()),
    GetPage(
        name: Utility.screenName(Screens.loginScreen),
        page: () => LoginScreen()),
    GetPage(
        name: Utility.screenName(Screens.homescreen), page: () => HomeScreen()),
  ];
}

enum Screens {
  splash,
  loginScreen,
  homescreen,
}
