// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/dashboardController/dashboard_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_small_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardDesktop extends GetView<ThemeChangeController> {
  DashboardDesktop({super.key, required this.visitSeriesData});

  List<AreaSeries<VisitsChartData?, DateTime?>> visitSeriesData;
  final DashboardController dashboardController =
      Get.find<DashboardController>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    const bool isMobile = false;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 50, bottom: 24),
      child: Obx(
        () => Row(
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
                          onTap: () => Get.toNamed('/post'),
                          child: DashboardSmallWidget(
                            title: "Posts",
                            subTitle: "Published Posts",
                            width: width,
                            percentage: dashboardController.percentage.value,
                            svgIconPath: "assets/icons/post-list.svg",
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
                          onTap: () => Get.toNamed('/order'),
                          child: DashboardSmallWidget(
                            title: "Orders",
                            subTitle: "Active Orders",
                            width: width,
                            percentage: 0,
                            svgIconPath: "assets/icons/order-list.svg",
                            color: controller.isDarkMode.value
                                ? kPrimaryColor
                                : kDarkCardColor,
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
                  width: width * .515,
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
                      backgroundColor: controller.isDarkMode.value
                          ? kDarkCardColor
                          : kCardColor,
                      plotAreaBorderWidth: 0,
                      primaryXAxis: DateTimeAxis(
                          name: 'X-Axis',
                          majorGridLines: const MajorGridLines(width: 0)),
                      primaryYAxis: NumericAxis(
                          axisLine: const AxisLine(width: 0),
                          // anchorRangeToVisiblePoints: _enableAnchor,
                          majorTickLines: const MajorTickLines(size: 0)),
                      series: visitSeriesData,
                    ),

                    // SfSparkAreaChart.custom(
                    //     labelDisplayMode: SparkChartLabelDisplayMode.all,
                    //     trackball: const SparkChartTrackball(
                    //         activationMode: SparkChartActivationMode.tap),
                    //     dataCount: visitors.length,
                    //     xValueMapper: (int index) => visitors[index].month,
                    //     yValueMapper: (int index) =>
                    //         visitors[index].visits),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: width * .515,
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
                    child: SingleChildScrollView(
                      child: DataTable(
                        border: TableBorder.all(
                            color: Colors.black,
                            width: .7,
                            style: BorderStyle.none),
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "Top Ads",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "232343",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "100,000",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "Top Ads",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "232343",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "100,000",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  "1",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "Top Ads",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "232343",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                              DataCell(
                                Text(
                                  "100,000",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                              ),
                            ],
                          ),
                        ],
                        columns: [
                          DataColumn(
                            label: Text(
                              "ID",
                              style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? kWhiteColor
                                      : kDarkCardColor),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                              label: Text(
                            "Name",
                            style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? kWhiteColor
                                    : kDarkCardColor),
                          )),
                          DataColumn(
                            label: Text(
                              "Order Number,",
                              style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? kWhiteColor
                                      : kDarkCardColor),
                            ),
                            numeric: true,
                          ),
                          DataColumn(
                            label: Text(
                              "Amount",
                              style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? kWhiteColor
                                      : kDarkCardColor),
                            ),
                            numeric: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: width * 0.21,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Recent Sales",
                          style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkCardColor),
                        ),
                      ),
                      SizedBox(
                        width: width * .21,
                        child: SingleChildScrollView(
                          child: DataTable(
                            border: TableBorder.all(
                                color: Colors.black,
                                width: 1.0,
                                style: BorderStyle.none),
                            rows: [
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                              DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      "1",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "Top Ads",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "100,000",
                                      style: TextStyle(
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                            columns: [
                              DataColumn(
                                label: Text(
                                  "ID",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                                numeric: true,
                              ),
                              DataColumn(
                                  label: Text(
                                "Product",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? kWhiteColor
                                        : kDarkCardColor),
                              )),
                              DataColumn(
                                label: Text(
                                  "Amount",
                                  style: TextStyle(
                                      color: controller.isDarkMode.value
                                          ? kWhiteColor
                                          : kDarkCardColor),
                                ),
                                numeric: true,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  width: width * 0.21,
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
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          "Project Sales",
                          style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkCardColor),
                        ),
                      ),
                      SingleChildScrollView(
                        child: DataTable(
                          border: TableBorder.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.none),
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(
                                    "1",
                                    style: TextStyle(
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    "Top Ads",
                                    style: TextStyle(
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    "100,000",
                                    style: TextStyle(
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor),
                                  ),
                                ),
                              ],
                            ),
                          ],
                          columns: [
                            DataColumn(
                              label: Text(
                                "ID",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? kWhiteColor
                                        : kDarkCardColor),
                              ),
                              numeric: true,
                            ),
                            DataColumn(
                                label: Text(
                              "Product",
                              style: TextStyle(
                                  color: controller.isDarkMode.value
                                      ? kWhiteColor
                                      : kDarkCardColor),
                            )),
                            DataColumn(
                              label: Text(
                                "Amount",
                                style: TextStyle(
                                    color: controller.isDarkMode.value
                                        ? kWhiteColor
                                        : kDarkCardColor),
                              ),
                              numeric: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 48,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
