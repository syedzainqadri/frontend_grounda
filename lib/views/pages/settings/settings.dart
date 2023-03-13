// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/settings/widgets/settings_menu_card.dart';
import 'package:get/get.dart';

import '../../../widgets/dashboard/dashboard_app_bar.dart';

class SettingsPage extends GetView<ThemeChangeController> {
  SettingsPage({Key? key}) : super(key: key);

  var width = Get.width;
  var height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: controller.isDarkMode.value ? kDarkColor : kWhiteColor,
      appBar: DashBoardAppBar(title: "Settings"),
      body: Center(
        child: SizedBox(
          height: height * .9,
          width: width * .8,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {
                    Get.toNamed('/profile');
                  },
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
                SettingsMenuCard(
                  height: height,
                  width: width,
                  text: 'Profile Settings',
                  icon: 'assets/icons/person.svg',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
