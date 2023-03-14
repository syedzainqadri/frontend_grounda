import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/models/VisitsData.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/post/post_page_desktop.dart';
import 'package:frontend_grounda/views/pages/post/post_page_mobile.dart';
import 'package:frontend_grounda/views/responsive/responsive_layout.dart';
import 'package:frontend_grounda/widgets/dashboard/DashboardAppBar.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PostPage extends GetView<ThemeChangeController> {
  PostPage({Key? key}) : super(key: key);

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
    var width = Get.width;
    // var height = Get.height;

    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkColor : kWhiteColor,
        appBar: DashBoardAppBar(title: "Posts"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Container(
              decoration: BoxDecoration(
                color:
                    controller.isDarkMode.value ? kDarkCardColor : kCardColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: controller.isDarkMode.value
                        ? kDarkShadowColor.withOpacity(.9)
                        : kShadowColor.withOpacity(.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: ResponsiveLayout(
                  desktopBody: PostPageDesktop(),
                  mobileBody: PostPageMobile(),
                ),
              ),
            ),
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
