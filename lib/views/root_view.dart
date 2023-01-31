import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
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
import '../utils/global_variable.dart';
import 'sidebar/mobile_sidebar.dart';

class RootView extends GetView<SideBarController> {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: controller.scaffoldKey,
      body: Obx(
        () => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: width >= 920
                  ? show.value == false
                      ? width * 0.15
                      : width * 0.05
                  : width > 600
                      ? show.value == false
                          ? width * 0.1
                          : width * 0.25
                      : 0,
              child: width >= 920
                  ? show.value == false
                      ? DesktopSidebar(sideBarController: controller)
                      : TabletSidebar(sideBarController: controller)
                  : width > 600
                      ? show.value == false
                          ? TabletSidebar(sideBarController: controller)
                          : MobileSidebar(sideBarController: controller)
                      : null,
            ),
            Flexible(
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
