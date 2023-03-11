import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/menuController.dart/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/widgets/sidebar_item.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TabletSidebar extends GetView<ThemeChangeController> {
  SideBarController sideBarController;
  TabletSidebar({Key? key, required this.sideBarController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Drawer(
        backgroundColor: controller.isDarkMode.value ? kDarkColor : kFrameColor,
        child: Column(
          children: [
            const SizedBox(height: 4),
            SizedBox(
                height: 60,
                child: Padding(
                  padding: const EdgeInsets.only(left: 13.0),
                  child: SvgPicture.asset("assets/images/logo.svg",
                      height: 250, width: 250),
                )),
            const SizedBox(height: 4),
            const Divider(),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    title: sideBarController.namesList[index],
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: true,
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
                  show.value = false;
                },
                icon: const Icon(Icons.arrow_forward_ios))
          ],
        ),
      ),
    );
  }
}
