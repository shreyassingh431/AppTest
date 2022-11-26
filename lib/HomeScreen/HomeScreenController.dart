// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:textrade/Common/HexColorHelper.dart';
import 'package:textrade/Common/notification_services.dart';
import 'package:textrade/Widgets/create_meeting_view.dart';
import 'package:textrade/db/db_helper.dart';
import 'package:textrade/model/Reminder.dart';

class HomeScreenController extends GetxController {
  var reminderList = <Reminder>[].obs;
  NotifyHelper notifyHelper = NotifyHelper();
  @override
  void onInit() {
    notifyHelper.initializeNotification();
    getTask();
    super.onInit();
  }

  Future<void> getTask() async {
    final List<Map<String, dynamic>> tasks = await DBHelper().queryAllRows();
    reminderList
        .assignAll(tasks.map((data) => Reminder.fromJson(data)).toList());
    print(reminderList);
  
  }

  

  get showScheduleDialog {
    Get.bottomSheet(
      StatefulBuilder(builder: (context, setState) {
        return CreateMeetingView.shared.createMeeting(this);
      }),
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //   topLeft: Radius.circular(30.0),
      //   topRight: Radius.circular(30.0),
      // )),
      clipBehavior: Clip.hardEdge,
      isScrollControlled: true,
      backgroundColor: HexColor("#EFF2F7"),
      isDismissible: true,
      enableDrag: true,
    );
  }
}
