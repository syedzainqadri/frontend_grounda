// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<ThemeChangeController> {
  SettingsPage({Key? key}) : super(key: key);

  var width = Get.width;
  var height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.isDarkMode.value = !controller.isDarkMode.value;
            },
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: kWhiteColor),
          width: width * .8,
          height: height * .9,
        ),
      ),
    );
  }
}
