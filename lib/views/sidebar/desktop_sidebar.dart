import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/menuController.dart/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/widgets/sidebar_item.dart';
import 'package:get/get.dart';
import '../../controllers/themeController.dart/theme_change_controller.dart';

class DesktopSidebar extends GetView<ThemeChangeController> {
  final SideBarController sideBarController;
  const DesktopSidebar({Key? key, required this.sideBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
        backgroundColor: controller.isDarkMode.value ? kDarkColor : kWhiteColor,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 40,
              child: Image.asset("assets/images/dashboard-logo.png",
                  height: 80, width: 150),
            ),
            const SizedBox(height: 0),
            const Divider(),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    title: sideBarController.namesList[index],
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: false,
                    press: () {
                      sideBarController.onSelected(index);
                    },
                  );
                },
              ),
            ),
            const Divider(),
            IconButton(
                onPressed: () {
                  show.value = true;
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: controller.isDarkMode.value ? kDarkColor : kWhiteColor,
                ))
          ],
        ),
      ),
    );
  }
}
