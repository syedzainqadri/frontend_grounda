// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/footer/footer.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_small_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardMobile extends GetView<ThemeChangeController> {
  DashboardMobile({super.key, required this.visitSeriesData});

  List<AreaSeries<VisitsChartData?, DateTime?>> visitSeriesData;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    const bool isMobile = true;
    return Padding(
      padding: const EdgeInsets.only(
        top: 24.0,
        left: 15,
        bottom: 24,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DashboardSmallWidget(
                title: "Posts",
                subTitle: "Published Posts",
                width: width * .8,
                percentage: 80,
                svgIconPath: "assets/icons/post-list.svg",
                color: kGoldenColor,
                isMobile: isMobile,
              ),
              const SizedBox(
                height: 24,
              ),
              DashboardSmallWidget(
                title: "Orders",
                subTitle: "Active Orders",
                width: width * .8,
                percentage: 65,
                svgIconPath: "assets/icons/order-list.svg",
                color: kDarkColor,
                isMobile: isMobile,
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: width * .8,
                decoration: const BoxDecoration(
                  color: kFrameColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SfCartesianChart(
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
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: width * .8,
                decoration: const BoxDecoration(
                  color: kFrameColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: DataTable(
                      border: TableBorder.all(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.none),
                      rows: const [
                        DataRow(
                          cells: [
                            DataCell(
                              Text("1"),
                            ),
                            DataCell(
                              Text("Top Ads"),
                            ),
                            DataCell(
                              Text("232343"),
                            ),
                            DataCell(
                              Text("100,000"),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("1"),
                            ),
                            DataCell(
                              Text("Top Ads"),
                            ),
                            DataCell(
                              Text("232343"),
                            ),
                            DataCell(
                              Text("100,000"),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            DataCell(
                              Text("1"),
                            ),
                            DataCell(
                              Text("Top Ads"),
                            ),
                            DataCell(
                              Text("232343"),
                            ),
                            DataCell(
                              Text("100,000"),
                            ),
                          ],
                        ),
                      ],
                      columns: const [
                        DataColumn(
                          label: Text("ID"),
                          numeric: true,
                        ),
                        DataColumn(label: Text("Name")),
                        DataColumn(
                          label: Text("Order Number"),
                          numeric: true,
                        ),
                        DataColumn(
                          label: Text("Amount"),
                          numeric: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: width * .8,
                decoration: const BoxDecoration(
                  color: kFrameColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "Recent Sales",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    SingleChildScrollView(
                      child: DataTable(
                        border: TableBorder.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.none),
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                        ],
                        columns: const [
                          DataColumn(
                            label: Text("ID"),
                            numeric: true,
                          ),
                          DataColumn(label: Text("Product")),
                          DataColumn(
                            label: Text("Amount"),
                            numeric: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: width * .8,
                decoration: const BoxDecoration(
                  color: kFrameColor,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text(
                        "Project Sales",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    SingleChildScrollView(
                      child: DataTable(
                        border: TableBorder.all(
                            color: Colors.black,
                            width: 1.0,
                            style: BorderStyle.none),
                        rows: const [
                          DataRow(
                            cells: [
                              DataCell(
                                Text("1"),
                              ),
                              DataCell(
                                Text("Top Ads"),
                              ),
                              DataCell(
                                Text("100,000"),
                              ),
                            ],
                          ),
                        ],
                        columns: const [
                          DataColumn(
                            label: Text("ID"),
                            numeric: true,
                          ),
                          DataColumn(label: Text("Product")),
                          DataColumn(
                            label: Text("Amount"),
                            numeric: true,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              const Footer()
            ],
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
