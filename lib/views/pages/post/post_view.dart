import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/menuController/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/dashboard/dashboard_desktop_posts.dart';
import 'package:frontend_grounda/views/sidebar/desktop_sidebar.dart';
import 'package:frontend_grounda/views/sidebar/tablet_desktop.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
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
                children: [
                  DashboardDesktopPosts(
                    visitSplineSeriesData: getDefaultSplineSeries(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<SplineSeries<VisitsChartData, String>> getDefaultSplineSeries() {
    return <SplineSeries<VisitsChartData, String>>[
      SplineSeries<VisitsChartData, String>(
        color: Colors.black,
        dataSource: completedPosts,
        xValueMapper: (VisitsChartData sales, _) => sales.x,
        yValueMapper: (VisitsChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: false),
        name: 'Completed',
      ),
      SplineSeries<VisitsChartData, String>(
        color: kPrimaryColor,
        dataSource: createdPosts,
        xValueMapper: (VisitsChartData sales, _) => sales.x,
        yValueMapper: (VisitsChartData sales, _) => sales.y,
        markerSettings: const MarkerSettings(isVisible: false),
        name: 'Created',
      ),
    ];
  }

  List<VisitsChartData> createdPosts = [
    VisitsChartData(
        x: 'Jan', y: 43, secondSeriesYValue: 37, thirdSeriesYValue: 41),
    VisitsChartData(
        x: 'Feb', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45),
    VisitsChartData(
        x: 'Mar', y: 50, secondSeriesYValue: 39, thirdSeriesYValue: 48),
    VisitsChartData(
        x: 'Apr', y: 55, secondSeriesYValue: 43, thirdSeriesYValue: 52),
    VisitsChartData(
        x: 'May', y: 63, secondSeriesYValue: 48, thirdSeriesYValue: 57),
    VisitsChartData(
        x: 'Jun', y: 68, secondSeriesYValue: 54, thirdSeriesYValue: 61),
    VisitsChartData(
        x: 'Jul', y: 72, secondSeriesYValue: 57, thirdSeriesYValue: 66),
    VisitsChartData(
        x: 'Aug', y: 70, secondSeriesYValue: 57, thirdSeriesYValue: 66),
    VisitsChartData(
        x: 'Sep', y: 66, secondSeriesYValue: 54, thirdSeriesYValue: 63),
    VisitsChartData(
        x: 'Oct', y: 57, secondSeriesYValue: 48, thirdSeriesYValue: 55),
    VisitsChartData(
        x: 'Nov', y: 50, secondSeriesYValue: 43, thirdSeriesYValue: 50),
    VisitsChartData(
        x: 'Dec', y: 45, secondSeriesYValue: 37, thirdSeriesYValue: 45)
  ];

  List<VisitsChartData> completedPosts = [
    VisitsChartData(
        x: 'Jan', y: 0, secondSeriesYValue: 37, thirdSeriesYValue: 41),
    VisitsChartData(
        x: 'Feb', y: 20, secondSeriesYValue: 37, thirdSeriesYValue: 45),
    VisitsChartData(
        x: 'Mar', y: 15, secondSeriesYValue: 39, thirdSeriesYValue: 48),
    VisitsChartData(
        x: 'Apr', y: 18, secondSeriesYValue: 43, thirdSeriesYValue: 52),
    VisitsChartData(
        x: 'May', y: 20, secondSeriesYValue: 48, thirdSeriesYValue: 57),
    VisitsChartData(
        x: 'Jun', y: 40, secondSeriesYValue: 54, thirdSeriesYValue: 61),
    VisitsChartData(
        x: 'Jul', y: 45, secondSeriesYValue: 57, thirdSeriesYValue: 66),
    VisitsChartData(
        x: 'Aug', y: 55, secondSeriesYValue: 57, thirdSeriesYValue: 66),
    VisitsChartData(
        x: 'Sep', y: 60, secondSeriesYValue: 54, thirdSeriesYValue: 63),
    VisitsChartData(
        x: 'Oct', y: 65, secondSeriesYValue: 48, thirdSeriesYValue: 55),
    VisitsChartData(
        x: 'Nov', y: 70, secondSeriesYValue: 43, thirdSeriesYValue: 50),
    VisitsChartData(
        x: 'Dec', y: 78, secondSeriesYValue: 37, thirdSeriesYValue: 45)
  ];
}
