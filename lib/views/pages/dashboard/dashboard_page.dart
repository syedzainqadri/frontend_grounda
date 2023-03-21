// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/dashboard/dashboard_desktop.dart';
import 'package:frontend_grounda/views/pages/dashboard/dashboard_mobile.dart';
import 'package:frontend_grounda/views/responsive/responsive_layout.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardPage extends GetView<ThemeChangeController> {
  DashboardPage({Key? key}) : super(key: key);

  List<VisitsChartData> visitChartData = [
    VisitsChartData(x: DateTime(1950, 3, 31), y: 80.7),
    VisitsChartData(x: DateTime(1950, 5), y: 80.2),
    VisitsChartData(x: DateTime(1950, 6, 2), y: 79.3),
    VisitsChartData(x: DateTime(1950, 7, 3), y: 78.6),
    VisitsChartData(x: DateTime(1950, 8, 4), y: 79.5),
    VisitsChartData(x: DateTime(1950, 9, 5), y: 78.9),
    VisitsChartData(x: DateTime(1950, 10, 6), y: 78.2),
    VisitsChartData(x: DateTime(1950, 11, 07), y: 77.4)
  ];

  @override
  Widget build(BuildContext context) {
    // var width = Get.width;
    // var height = Get.height;

    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkColor : kWhiteColor,
        appBar: DashBoardAppBar(title: "Dashboard"),
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            desktopBody:
                DashboardDesktop(visitSeriesData: getDefaultPanningSeries()),
            mobileBody:
                DashboardMobile(visitSeriesData: getDefaultPanningSeries()),
          ),
        ),
      ),
    );
  }

  List<AreaSeries<VisitsChartData, DateTime>> getDefaultPanningSeries() {
    return <AreaSeries<VisitsChartData, DateTime>>[
      AreaSeries<VisitsChartData, DateTime>(
          dataSource: visitChartData,
          xValueMapper: (VisitsChartData sales, _) => sales.x as DateTime,
          yValueMapper: (VisitsChartData sales, _) => sales.y,
          gradient: LinearGradient(
              colors: <Color>[Colors.teal[50]!, Colors.teal[200]!, Colors.teal],
              stops: const <double>[0.0, 0.4, 1.0],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter))
    ];
  }
}
