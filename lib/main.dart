import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:textrade/Common/Constants.dart';
import 'package:textrade/Common/Utilies.dart';
import 'package:textrade/SplashScreen/SplashScreen.dart';
import 'package:textrade/db/db_helper.dart';

import 'Common/Routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper().database;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return GetMaterialApp(
      title: 'Test App',
      debugShowCheckedModeBanner: false,
      initialRoute: Utility.screenName(Screens.splash),
      getPages: Routes.shared.pages,
      theme: ThemeData(
        primarySwatch: appColor,
      ),
      home: SplashScreen(),
    );
  }
}
