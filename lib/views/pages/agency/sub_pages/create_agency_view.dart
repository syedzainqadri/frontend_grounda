import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/menuController/sidebar_controller.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/views/pages/agency/sub_pages/create_agency_page.dart';
import 'package:frontend_grounda/views/sidebar/desktop_sidebar.dart';
import 'package:frontend_grounda/views/sidebar/mobile_sidebar.dart';
import 'package:frontend_grounda/views/sidebar/tablet_desktop.dart';
import 'package:get/get.dart';

class CreateAgencyView extends GetView<SideBarController> {
  const CreateAgencyView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: controller.scaffoldKey,
      body: Obx(
        () => Row(
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
                      ? DesktopSidebar(sideBarController: controller)
                      : TabletSidebar(sideBarController: controller)
                  : width < 920
                      ? show.value == false
                          ? TabletSidebar(sideBarController: controller)
                          : MobileSidebar(sideBarController: controller)
                      : null,
            ),
            Flexible(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CreateAgency(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// Hover color effect on test field
// price icon svg 
// space evenly in price row
// remove one upload button and alight to right side and increase heading side
// add google map 
// address
// re arrange the has installment etc
// columns based
// add plus button for images uploads

