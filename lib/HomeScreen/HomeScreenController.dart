// ignore_for_file: unnecessary_brace_in_string_interps


import 'package:get/get.dart';
import 'package:textrade/Common/notification_services.dart';
import 'package:textrade/Widgets/createReminder.dart';
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
    Get.dialog(
      CreateReminderDialog(),
      barrierDismissible: false,
    );

    // Get.bottomSheet(
    //   StatefulBuilder(builder: (context, setState) {
    //     return CreateReminderView.shared.createMeeting(this);
    //   }),
    //   // shape: const RoundedRectangleBorder(
    //   //     borderRadius: BorderRadius.only(
    //   //   topLeft: Radius.circular(30.0),
    //   //   topRight: Radius.circular(30.0),
    //   // )),
    //   clipBehavior: Clip.hardEdge,
    //   isScrollControlled: true,
    //   backgroundColor: HexColor("#EFF2F7"),
    //   isDismissible: true,
    //   enableDrag: true,
    // );
  }
}
