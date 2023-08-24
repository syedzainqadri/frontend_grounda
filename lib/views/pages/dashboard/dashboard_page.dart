// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/dashboard/dashboard_desktop_orders.dart';
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

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: "Dashboard"),
        body: SingleChildScrollView(
          child: ResponsiveLayout(
            desktopBody: DashboardDesktopOrders(
              visitColumnSeriesData: getTracker(),
              visitSplineSeriesData: getDefaultSplineSeries(),
            ),
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

  List<ColumnSeries<VisitsChartData, String>> getTracker() {
    return <ColumnSeries<VisitsChartData, String>>[
      ColumnSeries<VisitsChartData, String>(
        color: kPrimaryColor,
        dataSource: <VisitsChartData>[
          VisitsChartData(x: '06', y: 400),
          VisitsChartData(x: '07', y: 500),
          VisitsChartData(x: '08', y: 700),
          VisitsChartData(x: '09', y: 650),
          VisitsChartData(x: '10', y: 400),
          VisitsChartData(x: '11', y: 300),
          VisitsChartData(x: '12', y: 500),
          VisitsChartData(x: '13', y: 700),
          VisitsChartData(x: '14', y: 650),
          VisitsChartData(x: '15', y: 400),
          VisitsChartData(x: '16', y: 300),
          VisitsChartData(x: '17', y: 800),
          VisitsChartData(x: '18', y: 700),
          VisitsChartData(x: '19', y: 650),
          VisitsChartData(x: '20', y: 400),
          VisitsChartData(x: '21', y: 300),
          VisitsChartData(x: '22', y: 500),
          VisitsChartData(x: '23', y: 700),
          VisitsChartData(x: '24', y: 650),
          VisitsChartData(x: '25', y: 400),
          VisitsChartData(x: '26', y: 300),
          VisitsChartData(x: '27', y: 500),
          VisitsChartData(x: '28', y: 700),
          VisitsChartData(x: '29', y: 650),
          VisitsChartData(x: '30', y: 400),
        ],

        /// We can enable the track for column here.
        isTrackVisible: true,
        trackColor: const Color.fromRGBO(198, 201, 207, 1),
        borderRadius: BorderRadius.circular(15),
        xValueMapper: (VisitsChartData sales, _) => sales.x,
        yValueMapper: (VisitsChartData sales, _) => sales.y,
        name: 'Marks',
        // dataLabelSettings: const DataLabelSettings(
        //     isVisible: true,
        //     labelAlignment: ChartDataLabelAlignment.top,
        //     textStyle: TextStyle(fontSize: 10, color: Colors.white))
      )
    ];
  }
}
