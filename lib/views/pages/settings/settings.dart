// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/settings/widgets/settings_menu_card.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

class SettingsPage extends GetView<ThemeChangeController> {
  SettingsPage({Key? key}) : super(key: key);

  var width = Get.width;
  var height = Get.height;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
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
                    text: 'payment Methods',
                    icon: 'assets/icons/person.svg',
                    onPressed: () {
                      Get.toNamed('/settings/payment-methods');
                    },
                  ),
                  SettingsMenuCard(
                    height: height,
                    width: width,
                    text: 'Amenities',
                    icon: 'assets/icons/person.svg',
                    onPressed: () {
                      Get.toNamed('/settings/amenities');
                    },
                  ),
                  SettingsMenuCard(
                    height: height,
                    width: width,
                    text: 'Project Near By Places',
                    icon: 'assets/icons/project-list.svg',
                    onPressed: () {
                      Get.toNamed('/settings/project-near-by-places');
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
