import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textrade/Common/Routes.dart';

import '../Common/Utilies.dart';

class LoginScreenControler extends GetxController {
  var userIdTextFieldController = TextEditingController();
  var passWordTextFieldController = TextEditingController();

  void loginPressed() {
    if (userIdTextFieldController.text.isEmpty) {
      Utility.showErrorView("Alert", "Please Enter Email Id",
          alertType: AlertType.error);
    } else if (passWordTextFieldController.text.isEmpty) {
      Utility.showErrorView("Alert", "Please Enter Password",
          alertType: AlertType.error);
    } else {
      loginApi();
    }
  }

  void loginApi() async {
    Get.toNamed(Utility.screenName(Screens.homescreen));
  }
}
