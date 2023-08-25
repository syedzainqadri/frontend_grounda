// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/dashboardController/dashboard_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_totalCount_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardDesktopPosts extends GetView<ThemeChangeController> {
  DashboardDesktopPosts({super.key, required this.visitSplineSeriesData});

  List<SplineSeries<VisitsChartData, String>> visitSplineSeriesData;
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    const bool isMobile = false;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 50, bottom: 24),
      child: Obx(
        () => SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () => Get.toNamed('/allpost'),
                            child: DashboardTotalCountWidget(
                              title: "Total Posts",
                              subTitle: "Current month",
                              width: width,
                              totalCount:
                                  dashboardController.totalPostCount.value,
                              color: kPrimaryColor,
                              isMobile: isMobile,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        children: [
                          InkWell(
                            // onTap: () => Get.toNamed('/post'),
                            child: DashboardTotalCountWidget(
                              title: "Published Posts",
                              subTitle: "Current month",
                              width: width,
                              totalCount: dashboardController
                                  .totalPublishedPostCount.value,
                              color: kPrimaryColor,
                              isMobile: isMobile,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        children: [
                          InkWell(
                            // onTap: () => Get.toNamed('/post'),
                            child: DashboardTotalCountWidget(
                              title: "Pending",
                              subTitle: "Current month",
                              width: width,
                              totalCount: dashboardController
                                  .totalPendingPostCount.value,
                              color: kPrimaryColor,
                              isMobile: isMobile,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: width * .790,
                    decoration: BoxDecoration(
                      color: controller.isDarkMode.value
                          ? kDarkCardColor
                          : kCardColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: controller.isDarkMode.value
                              ? kDarkShadowColor.withOpacity(.2)
                              : kShadowColor.withOpacity(.2),
                        ),
                      ],
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: SfCartesianChart(
                          title: ChartTitle(
                            text: 'Published Post vs Pending Post',
                            alignment: ChartAlignment.near,
                          ),
                          backgroundColor: controller.isDarkMode.value
                              ? kDarkCardColor
                              : kCardColor,
                          plotAreaBorderWidth: 0,
                          primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              labelPlacement: LabelPlacement.onTicks),
                          primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: 80,
                              axisLine: const AxisLine(width: 0),
                              edgeLabelPlacement: EdgeLabelPlacement.shift,
                              labelFormat: '{value}K',
                              majorTickLines: const MajorTickLines(size: 0)),
                          series: visitSplineSeriesData,
                          tooltipBehavior: TooltipBehavior(enable: true),
                        )),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Container(
                    width: width * .790,
                    decoration: BoxDecoration(
                      color: controller.isDarkMode.value
                          ? kDarkCardColor
                          : kCardColor,
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: controller.isDarkMode.value
                              ? kDarkShadowColor.withOpacity(.2)
                              : kShadowColor.withOpacity(.2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Recent Posts",
                            style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kCardColor
                                  : kDarkCardColor,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Studio flat for sale in  \nKorangi Karachi",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Category",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Flat",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Date Posted",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "9 Jun, 2023",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  )
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Posted By",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kPrimaryColor
                                          : Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Ajmal Khan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
