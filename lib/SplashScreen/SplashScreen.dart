import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textrade/Common/Constants.dart';
import 'package:textrade/SplashScreen/SplashScreenController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  var controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              appIcon,
            ),
            const Text(
              "Remind Me",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
