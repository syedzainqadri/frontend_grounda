import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/agency/agency_page.dart';
import 'package:frontend_grounda/views/pages/category/category_page.dart';
import 'package:frontend_grounda/views/pages/customer/customer_page.dart';
import 'package:frontend_grounda/views/pages/dashboard/dashboard_page.dart';
import 'package:frontend_grounda/views/pages/developer/developer_page.dart';
import 'package:frontend_grounda/views/pages/post/post_page.dart';
import 'package:frontend_grounda/views/pages/product/product_page.dart';
import 'package:frontend_grounda/views/pages/project/project_page.dart';
import 'package:frontend_grounda/views/sidebar/desktop_sidebar.dart';
import 'package:frontend_grounda/views/sidebar/tablet_desktop.dart';
import 'package:get/get.dart';
import 'sidebar/mobile_sidebar.dart';

class RootView extends GetView<SideBarController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    var show = false.obs;

    return Scaffold(
      key: controller.scaffoldKey,
      appBar: AppBar(
        backgroundColor: kDarkColor,
        elevation: 0,
        title: Obx(
          () => Text(
            controller.title.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        leading: Obx(
          () => show.value == false
              ? IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    show.value = true;
                    print(show.value);
                    if (width > 200 && width < 500) {
                      controller.scaffoldKey.currentState?.openDrawer();
                    }
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    show.value = false;
                    if (width > 200 && width < 500) {
                      controller.scaffoldKey.currentState?.openDrawer();
                    }
                  },
                ),
        ),
        actions: [
          Row(
            children: [
              const Icon(Icons.logout, size: 20, color: kWhiteColor),
              Text(
                "Logout",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(width: 2),
            ],
          ),
        ],
      ),
      body: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width >= 920
                  ? show.value == true
                      ? width * 0.15
                      : 0
                  : width > 600
                      ? show.value == true
                          ? width * 0.1
                          : 0
                      : 0,
              child: width >= 920
                  ? show.value == true
                      ? DesktopSidebar(sideBarController: controller)
                      : MobileSidebar(sideBarController: controller)
                  : width > 600
                      ? show.value == true
                          ? TabletSidebar(sideBarController: controller)
                          : MobileSidebar(sideBarController: controller)
                      : null,
            ),
            SizedBox(
              width: width > 920
                  ? show.value == true
                      ? width * 0.85
                      : width
                  : width > 600
                      ? show.value == true
                          ? width * 0.9
                          : width
                      : width,
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  DashboardPage(),
                  CustomerPage(),
                  CategoryPage(),
                  PostPage(),
                  ProjectPage(),
                  AgencyPage(),
                  DeveloperPage(),
                  ProductPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
