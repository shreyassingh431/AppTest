import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textrade/Common/HexColorHelper.dart';
import 'package:textrade/HomeScreen/HomeScreenController.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              _title(),
              const SizedBox(
                height: 10,
              ),
              _listItems()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeScreenController.showScheduleDialog;
        },
        backgroundColor: HexColor("#FF0000"),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _listItems() {
    return SizedBox(
        height: MediaQuery.of(Get.context!).size.height * 0.8,
        child: Obx(
          () => ListView.builder(
              shrinkWrap: true,
              itemCount: homeScreenController.reminderList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      leading: AvatarWidget(
                        homeScreenController: homeScreenController,
                        index: index,
                      ),
                      subtitle: Text(
                        homeScreenController
                                .reminderList.value[index].description ??
                            "",
                        style: const TextStyle(color: Colors.grey),
                      ),
                      title: Text(
                          homeScreenController.reminderList.value[index].name ??
                              "")),
                );
              }),
        ));
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: HexColor("#FF0000"),
      foregroundColor: Colors.white,
      leading: const Icon(
        Icons.menu,
        color: Colors.white,
      ),
      title: const Text("Dashboard"),
      // title: ,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
        const SizedBox(
          width: 18,
        )
      ],
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Today",
        style: TextStyle(fontSize: 21),
      ),
    );
  }
}

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    Key? key,
    required this.homeScreenController,
    required this.index,
  }) : super(key: key);

  final HomeScreenController homeScreenController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: homeScreenController.reminderList.value[index].imgPath != null
          ? Image.file(
              File(
                  homeScreenController.reminderList.value[index].imgPath ?? ""),
              fit: BoxFit.cover,
              height: 60,
              width: 60,
            )
          : const Icon(Icons.person, size: 60),
    );
  }
}
