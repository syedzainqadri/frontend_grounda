import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/menuController/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/post/post_page.dart';
import 'package:frontend_grounda/views/sidebar/desktop_sidebar.dart';
import 'package:frontend_grounda/views/sidebar/tablet_desktop.dart';
import 'package:get/get.dart';
import '../../../utils/global_variable.dart';
import '../../sidebar/mobile_sidebar.dart';

class PostView extends GetView<ThemeChangeController> {
  PostView({super.key});

  final SideBarController sideBarController = Get.find<SideBarController>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Obx(
      () => Scaffold(
        backgroundColor:
            controller.isDarkMode.value ? kDarkCardColor : kWhiteColor,
        // key: controller.scaffoldKey,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInQuart,
              transform: Matrix4.identity(),
              width: width >= 920
                  ? show.value == false
                      ? width * 0.15
                      : width * 0.05
                  : width < 920
                      ? show.value == false
                          ? width * 0.13
                          : width * 0.25
                      : 0,
              child: width >= 920
                  ? show.value == false
                      ? DesktopSidebar(sideBarController: sideBarController)
                      : TabletSidebar(sideBarController: sideBarController)
                  : width < 920
                      ? show.value == false
                          ? TabletSidebar(sideBarController: sideBarController)
                          : MobileSidebar(sideBarController: sideBarController)
                      : null,
            ),
            Flexible(
              child: PageView(
                controller: sideBarController.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [PostPage()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
