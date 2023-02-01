import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/DashboardSmallWidget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardPage extends GetView<ThemeChangeController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = Get.width;
    // var height = Get.height;

    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.isDarkMode.value = !controller.isDarkMode.value;
              print(controller.isDarkMode.value);
            },
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          DashboardSmallWidget(
                            title: "Posts",
                            subTitle: "Published Posts",
                            width: width,
                            percentage: 80,
                            svgIconPath: "assets/icons/post-list.svg",
                            color: kGoldenColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        children: [
                          DashboardSmallWidget(
                            title: "Orders",
                            subTitle: "Active Orders",
                            width: width,
                            percentage: 65,
                            svgIconPath: "assets/icons/order-list.svg",
                            color: kDarkColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: kFrameColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
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
                        padding: const EdgeInsets.all(20.0),
                        child: SfLinearGauge(
                          ranges: const <LinearGaugeRange>[
                            LinearGaugeRange(
                              color: kDarkColor,
                            )
                          ],
                          markerPointers: const <LinearMarkerPointer>[],
                          barPointers: const <LinearBarPointer>[],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Column(
                children: [
                  Container(
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
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                  ),
                  Container()
                ],
              )
            ],
          )),
    );
  }
}
