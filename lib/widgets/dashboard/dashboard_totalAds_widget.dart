// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardTotalAdsWidget extends GetView<ThemeChangeController> {
  DashboardTotalAdsWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.width,
      required this.percentage,
      required this.color,
      required this.isMobile});

  dynamic width;
  dynamic percentage;
  String title;
  String subTitle;
  Color color;
  bool isMobile = false;

  final ThemeChangeController themeController =
      Get.put(ThemeChangeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? width : width * .25,
      decoration: BoxDecoration(
        color: controller.isDarkMode.value ? kDarkCardColor : kCardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: controller.isDarkMode.value
                ? kDarkShadowColor.withOpacity(.2)
                : kShadowColor.withOpacity(.5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          color: controller.isDarkMode.value
                              ? kWhiteColor
                              : kDarkCardColor,
                          fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          color: controller.isDarkMode.value
                              ? kWhiteColor
                              : kDarkCardColor,
                          fontSize: 20),
                    ),
                  ],
                ),
                SizedBox(
                    width: isMobile ? width * .4 : width * .1,
                    height: 140,
                    child: SfCircularChart(series: <CircularSeries>[
                      // Renders radial bar chart
                      RadialBarSeries<VisitsChartData, String>(
                        dataSource: <VisitsChartData>[
                          VisitsChartData(
                              x: 'Data', y: percentage, pointColor: color),
                        ],
                        xValueMapper: (VisitsChartData data, _) => data.x,
                        yValueMapper: (VisitsChartData data, _) => data.y,
                        pointColorMapper: (VisitsChartData data, _) =>
                            data.pointColor,
                        maximumValue: 1,
                      ),
                    ]))
              ],
            )
          ],
        ),
      ),
    );
  }
}
