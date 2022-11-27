// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:gallery_saver/gallery_saver.dart';

// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:intl/intl.dart';
// import 'package:textrade/Common/HexColorHelper.dart';
// import 'package:textrade/Common/Utilies.dart';
// import 'package:textrade/HomeScreen/HomeScreenController.dart';
// import 'package:textrade/db/db_helper.dart';
// import 'package:textrade/model/Reminder.dart';

// class CreateReminderView {
//   static var shared = CreateReminderView();
//   final _nameController = TextEditingController();
//   final _descController = TextEditingController();
//   final _dateController = TextEditingController();
//   final _timeController = TextEditingController();
//   final _dateTimeController = TextEditingController();
//   String formattedMonth = "",
//       formattedDate = "",
//       formattedYear = "",
//       twentyFourhrformattedTime = "";
//   File? pickedImageFile;

//   Widget createMeeting(HomeScreenController homeScreenController) {
//     var color = HexColor("#EFF2F7");
//     String title = "New Reminder";
//     IconData closeICon = Icons.cancel;
//     Size size = MediaQuery.of(Get.context!).size;
//     return Material(
//       child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10.0),a
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text(
//                     title,
//                     textAlign: TextAlign.right,
//                     style: const TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(
//                     width: size.width * 0.25,
//                   ),
//                   InkWell(
//                     onTap: () => {_close, _clear},
//                     child: Icon(
//                       closeICon,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Divider(
//               height: 7,
//               thickness: 7,
//               color: HexColor("#C0CCDA"),
//             ),
//             reminderNameField(),
//             reminderDescriptionField(),
//             reminderDateTimeField(),
//             const SizedBox(
//               height: 5,
//             ),
//             selectImage(size),
//             Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   saveBtn(homeScreenController),
//                   resetBtn(),
//                 ],
//               ),
//             ),
//           ]),
//     );
//   }

//   Widget selectImage(Size size) {
//     return GestureDetector(
//       onTap: () => takeImageFromCamera(),
//       child: Container(
//           margin: const EdgeInsets.all(10),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//               border: Border.all(
//             color: HexColor("#FF0000"),
//           )),
//           child: Text(
//             "Select Image",
//             style: TextStyle(
//                 color: HexColor("#CA0017"),
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold),
//           )),
//     );
//   }

//   Widget reminderNameField() {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: TextFormField(
//           controller: _nameController,
//           style: const TextStyle(color: Colors.black),
//           maxLines: 1,
//           decoration: const InputDecoration(
//             hintText: 'Please Enter Reminder Name',
//             labelText: "Reminder Name",
//             labelStyle: TextStyle(color: Colors.black),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             border: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//           )),
//     );
//   }

//   Widget reminderDescriptionField() {
//     return Container(
//       margin: const EdgeInsets.only(left: 10, right: 10),
//       padding: const EdgeInsets.only(left: 10, right: 10),
//       child: TextFormField(
//           controller: _descController,
//           style: const TextStyle(color: Colors.black),
//           maxLines: 1,
//           decoration: const InputDecoration(
//             hintText: 'Please Enter Reminder Description',
//             labelText: "Reminder Description",
//             labelStyle: TextStyle(color: Colors.black),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//             border: UnderlineInputBorder(
//               borderSide: BorderSide(color: Colors.black),
//             ),
//           )),
//     );
//   }

//   Widget reminderDateTimeField() {
//     return GestureDetector(
//       onTap: () => _chooseDate,
//       child: Container(
//         margin: const EdgeInsets.only(left: 10, right: 10),
//         padding: const EdgeInsets.only(left: 10, right: 10),
//         child: TextFormField(
//             enabled: false,
//             controller: _dateTimeController,
//             style: const TextStyle(color: Colors.black),
//             maxLines: 1,
//             decoration: const InputDecoration(
//               hintText: 'Please Select Date and Time',
//               labelStyle: TextStyle(color: Colors.black),
//               enabledBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//               focusedBorder: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//               border: UnderlineInputBorder(
//                 borderSide: BorderSide(color: Colors.black),
//               ),
//             )),
//       ),
//     );
//   }

//   void _selectTime() async {
//     TimeOfDay? pickedTime = TimeOfDay.now();
//     pickedTime = await showTimePicker(
//       initialTime: TimeOfDay.now(),
//       context: Get.context!,
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: const ColorScheme.light(
//               // change the border color
//               primary: Colors.red,
//               // change the text color
//               onSurface: Colors.red,
//             ),
//             // button colors
//             buttonTheme: const ButtonThemeData(
//               colorScheme: ColorScheme.light(
//                 primary: Colors.green,
//               ),
//             ),
//           ),
//           child: child ?? Text(""),
//         );
//       },
//     );

//     if (pickedTime != null) {
//       print(pickedTime?.format(Get.context!)); //output 10:51 PM
//       DateTime parsedTime =
//           DateFormat.jm().parse(pickedTime!.format(Get.context!).toString());
//       //converting to DateTime so that we can further format on different pattern.
//       print(parsedTime); //output 1970-01-01 22:53:00.000
//       twentyFourhrformattedTime = DateFormat('HH:mm:ss').format(parsedTime);
//       print(twentyFourhrformattedTime); //output 14:59:00
//       _timeController.text = Utility.formatClockTime(twentyFourhrformattedTime);
//       //DateFormat() is from intl package, you can format the time on any pattern you need.
//       _dateTimeController.text =
//           "${_dateController.text} ${_timeController.text}";
//     }
//   }

//   get _chooseDate async {
//     DateTime? pickedDate = await showDatePicker(
//       context: Get.context!,
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData(
//             primarySwatch: Colors.grey,
//             splashColor: Colors.black,
//             textTheme: const TextTheme(
//               subtitle1: TextStyle(color: Colors.black),
//               button: TextStyle(color: Colors.black),
//             ),
//             accentColor: Colors.black,
//             colorScheme: const ColorScheme.light(
//                 primary: Color(0xffffbc00),
//                 primaryVariant: Colors.black,
//                 secondaryVariant: Colors.black,
//                 onSecondary: Colors.black,
//                 onPrimary: Colors.white,
//                 surface: Colors.black,
//                 onSurface: Colors.black,
//                 secondary: Colors.black),
//             dialogBackgroundColor: Colors.white,
//           ),
//           child: child ?? Text(""),
//         );
//       },
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2024),
//       //initialEntryMode: DatePickerEntryMode.input,
//       // initialDatePickerMode: DatePickerMode.year,
//       helpText: 'Select Date',
//       cancelText: 'Close',
//       confirmText: 'Confirm',
//       errorFormatText: 'Enter valid date',
//       errorInvalidText: 'Enter valid date range',
//       fieldLabelText: 'Date',
//       fieldHintText: 'Month/Date/Year',
//     );
//     if (pickedDate != null) {
//       formattedDate = DateFormat('dd').format(pickedDate);
//       formattedMonth = DateFormat('MM').format(pickedDate);
//       formattedYear = DateFormat('yyyy').format(pickedDate);
//       _dateController.text =
//           formattedMonth + "/" + formattedDate + "/" + formattedYear;
//       _selectTime();
//     }
//   }

//   Widget saveBtn(HomeScreenController homeScreenController) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: HexColor("#FF1111"),
//         minimumSize: const Size(150, 40),
//       ),
//       onPressed: () {
//         _saveReminder(homeScreenController);
//       },
//       child: const Text(
//         'SAVE',
//         style: TextStyle(color: Colors.white, fontSize: 22),
//       ),
//     );
//   }

//   void _saveReminder(HomeScreenController homeScreenController) {
//     if (_nameController.text.isEmpty) {
//       Utility.showErrorView("Alert", "Please Enter name",
//           alertType: AlertType.error);
//       return;
//     }

//     if (_descController.text.isEmpty) {
//       Utility.showErrorView("Alert", "Please Enter description",
//           alertType: AlertType.error);
//       return;
//     }

//     if (_dateTimeController.text.isEmpty) {
//       Utility.showErrorView("Alert", "Please select date and time",
//           alertType: AlertType.error);
//       return;
//     }

//     if (pickedImageFile == null) {
//       Utility.showErrorView("Alert", "Please select image",
//           alertType: AlertType.error);

//       return;
//     }

//     var reminder = Reminder(
//         id: 00,
//         name: _nameController.text,
//         description: _descController.text,
//         date: _dateController.text,
//         time: _timeController.text,
//         imgPath: pickedImageFile?.path);

//     DBHelper().insertTask(reminder);
//     homeScreenController.getTask();
//     _handlingReminder(homeScreenController, _timeController.text, reminder);
//     _close;
//     _openDialog;
//   }

//   Widget resetBtn() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: HexColor("#FF1111"),
//         minimumSize: const Size(150, 40),
//       ),
//       onPressed: () {
//         _clear;
//       },
//       child: const Text(
//         'RESET',
//         style: TextStyle(color: Colors.white, fontSize: 22),
//       ),
//     );
//   }

//   get _close {
//     Get.back();
//   }

//   get _clear {
//     _nameController.clear();
//     _descController.clear();
//     _dateController.clear();
//     _timeController.clear();
//     _dateTimeController.clear();
//     pickedImageFile = null;
//   }

//   void takeImageFromCamera() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.camera);
//     GallerySaver.saveImage(pickedImage!.path);
//     pickedImageFile = File(pickedImage!.path);
//   }

//   get _openDialog {
//     Get.dialog(
//       AlertDialog(
//         title: const Text('Alert'),
//         content: const Text('Reminder Set Successfully'),
//         actions: [
//           TextButton(
//             onPressed: () => Get.back(),
//             style: TextButton.styleFrom(
//               backgroundColor: HexColor("#FF0000"),
//             ),
//             child: const Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   _handlingReminder(HomeScreenController homeScreenController, var myTime,
//       Reminder reminder) {
//     var minutes = int.parse(myTime.toString().split(':')[1]);
//     var hours = int.parse(myTime.toString().split(':')[0]);
//     homeScreenController.notifyHelper
//         .scheduledNotification(hours, minutes, reminder);
//   }
// }
