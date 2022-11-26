import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'Routes.dart';

enum AlertType { success, error }

class Utility {
  static String screenName(Screens screenName) {
    return "/$screenName";
  }

  static showErrorView(String title, String message, {AlertType? alertType}) {
    Color? backgroundColor;
    switch (alertType) {
      case AlertType.success:
        backgroundColor = Colors.orange;
        break;

      case AlertType.error:
        backgroundColor = Colors.red;
        break;
      default:
        backgroundColor = Colors.orange;
        break;
    }
    Get.snackbar(
      title,
      message,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

static String formatClockTime(String bigTime) {
    DateTime tempDate = DateFormat('HH:mm:ss').parse(bigTime);
    var dateFormat = DateFormat("HH:mm"); // you can change the format here
    var utcDate = dateFormat.format(tempDate); // pass the UTC time here
    //  var localDate = dateFormat.parse(utcDate, true).toLocal().toString();
    //  String createdDate = dateFormat.format(DateTime.parse(localDate));
    print("------------$utcDate");
    return utcDate;
  }


  static String dateTimeToString(DateTime dateTime, String formate) {
    return DateFormat(formate).format(dateTime);
  }

  static hideLoader() {
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
  }
}
