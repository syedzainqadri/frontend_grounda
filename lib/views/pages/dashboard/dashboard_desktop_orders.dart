// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_totalAds_widget.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardDesktopOrders extends GetView<ThemeChangeController> {
  const DashboardDesktopOrders({
    super.key,
    required this.visitColumnSeriesData,
    required this.visitSplineSeriesData,
  });

  final List<ColumnSeries<VisitsChartData, String>> visitColumnSeriesData;
  final List<SplineSeries<VisitsChartData, String>> visitSplineSeriesData;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    bool isMobile = width < 600; // Adjust this value as needed

    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Orders'),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (isMobile)
                  DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkCardColor,
                    buttonText: "Show All Order",
                    width: width * 0.8,
                    height: height * 0.05,
                    onPressed: () {
                      Get.toNamed('/order');
                    },
                  ),
                if (!isMobile)
                  Align(
                    alignment: Alignment.topRight,
                    child: DefaultButton(
                      primaryColor: kPrimaryColor,
                      hoverColor: kDarkCardColor,
                      buttonText: "Show All Order",
                      width: width * .12,
                      height: height * .05,
                      onPressed: () {
                        Get.toNamed('/order');
                      },
                    ),
                  ),
                const SizedBox(height: 24),
                if (isMobile)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DashboardTotalAdsWidget(
                        title: "Top Ads",
                        subTitle: "684",
                        width: isMobile ? width : width * 0.45,
                        percentage: 0.75,
                        color: kPrimaryColor,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 24),
                      DashboardTotalAdsWidget(
                        title: "Bump Ads Sale",
                        subTitle: "546",
                        width: isMobile ? width : width * 0.25,
                        percentage: 0.55,
                        color: kSecondryColor,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 24),
                      DashboardTotalAdsWidget(
                        title: "Featured Ads",
                        subTitle: "5,732",
                        width: isMobile ? width : width * 0.25,
                        percentage: 0.75,
                        color: Colors.black,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                if (!isMobile)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (!isMobile)
                        DashboardTotalAdsWidget(
                          title: "Top Ads",
                          subTitle: "684",
                          width: width,
                          percentage: 0.75,
                          color: kPrimaryColor,
                          isMobile: isMobile,
                        ),
                      SizedBox(width: isMobile ? 16 : 24),
                      DashboardTotalAdsWidget(
                        title: "Bump Ads Sale",
                        subTitle: "546",
                        width: width,
                        percentage: 0.55,
                        color: kSecondryColor,
                        isMobile: isMobile,
                      ),
                      SizedBox(width: isMobile ? 16 : 24),
                      DashboardTotalAdsWidget(
                        title: "Featured Ads",
                        subTitle: "5,732",
                        width: width,
                        percentage: 0.75,
                        color: Colors.black,
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                SizedBox(height: isMobile ? 0 : 30),
                Container(
                  width: isMobile ? width : width * 0.9,
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Total Revenue"),
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      "Yearly",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Monthly",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text("Daily",
                                        style: TextStyle(color: Colors.grey)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              const Text(
                                "PKR 236,535",
                                style: TextStyle(fontSize: 31),
                              ),
                              const SizedBox(width: 20),
                              const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: Icon(
                                    Icons.arrow_upward_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("0,8%"),
                                  const SizedBox(height: 10),
                                  if (isMobile)
                                    const Text(
                                      "Than Last Day",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 14),
                                    ),
                                  if (!isMobile)
                                    const Text(
                                      "Than Last Day",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 200,
                          width: width,
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryXAxis: const CategoryAxis(
                                majorGridLines: MajorGridLines(width: 0)),
                            primaryYAxis: const NumericAxis(
                                minimum: 200,
                                maximum: 800,
                                labelFormat: '{value}K',
                                axisLine: AxisLine(width: 0),
                                majorGridLines: MajorGridLines(width: 0),
                                majorTickLines: MajorTickLines(size: 0)),
                            series: visitColumnSeriesData,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: isMobile ? 24 : 30),
                if (!isMobile)
                  Row(
                    children: [
                      Container(
                        width: width * .350,
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
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Property Referrals",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    kAdditionalColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Social Media",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              "20%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kSecondryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Marketplaces",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "40%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Websites",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 45,
                                            ),
                                            Text(
                                              "15%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kPrimaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Digital Ads",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text(
                                              "25%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Others",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 55,
                                            ),
                                            Text(
                                              "15%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 200,
                                      width: 200,
                                      child: SfCircularChart(
                                          series: <CircularSeries>[
                                            // Renders radial bar chart
                                            RadialBarSeries<VisitsChartData,
                                                String>(
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              dataSource: <VisitsChartData>[
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.4,
                                                    pointColor: kTextColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.5,
                                                    pointColor: kTextColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.6,
                                                    pointColor:
                                                        kAdditionalColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.7,
                                                    pointColor: kPrimaryColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.8,
                                                    pointColor: kSecondryColor),
                                              ],
                                              xValueMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.x,
                                              yValueMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.y,
                                              pointColorMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.pointColor,
                                              maximumValue: 1,
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(width: isMobile ? 0 : 50),
                      Column(
                        children: [
                          Container(
                            width: isMobile ? width : width * 0.4,
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
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Overview",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 200,
                                    width: width,
                                    child: SfCartesianChart(
                                      backgroundColor:
                                          controller.isDarkMode.value
                                              ? kDarkCardColor
                                              : kCardColor,
                                      plotAreaBorderWidth: 0,
                                      primaryXAxis: const CategoryAxis(
                                        majorGridLines:
                                            MajorGridLines(width: 0),
                                        labelPlacement: LabelPlacement.onTicks,
                                      ),
                                      primaryYAxis: const NumericAxis(
                                        minimum: 0,
                                        maximum: 80,
                                        axisLine: AxisLine(width: 0),
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift,
                                        labelFormat: '{value}K',
                                        majorTickLines:
                                            MajorTickLines(size: 0),
                                      ),
                                      series: visitSplineSeriesData,
                                      tooltipBehavior:
                                          TooltipBehavior(enable: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                if (isMobile)
                  Column(
                    children: [
                      Container(
                        width: isMobile ? width : width * 0.4,
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
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Property Referrals",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.more_vert,
                                        color: controller.isDarkMode.value
                                            ? kWhiteColor
                                            : kDarkCardColor,
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    kAdditionalColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Social Media",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              "20%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kSecondryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Marketplaces",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "40%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Websites",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 45,
                                            ),
                                            Text(
                                              "15%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kPrimaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Digital Ads",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 35,
                                            ),
                                            Text(
                                              "25%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircleAvatar(
                                                backgroundColor: kTextColor,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Others",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            SizedBox(
                                              width: 55,
                                            ),
                                            Text(
                                              "15%",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 200,
                                      width: 190,
                                      child: SfCircularChart(
                                          series: <CircularSeries>[
                                            // Renders radial bar chart
                                            RadialBarSeries<VisitsChartData,
                                                String>(
                                              cornerStyle:
                                                  CornerStyle.bothCurve,
                                              dataSource: <VisitsChartData>[
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.4,
                                                    pointColor: kTextColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.5,
                                                    pointColor: kTextColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.6,
                                                    pointColor:
                                                        kAdditionalColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.7,
                                                    pointColor: kPrimaryColor),
                                                VisitsChartData(
                                                    x: 'Data',
                                                    y: 0.8,
                                                    pointColor: kSecondryColor),
                                              ],
                                              xValueMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.x,
                                              yValueMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.y,
                                              pointColorMapper:
                                                  (VisitsChartData data, _) =>
                                                      data.pointColor,
                                              maximumValue: 1,
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(height: isMobile ? 25 : 50),
                      Column(
                        children: [
                          Container(
                            width: isMobile ? width : width * 0.4,
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
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Overview",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.more_vert,
                                          color: controller.isDarkMode.value
                                              ? kWhiteColor
                                              : kDarkCardColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 200,
                                    child: SfCartesianChart(
                                      backgroundColor:
                                          controller.isDarkMode.value
                                              ? kDarkCardColor
                                              : kCardColor,
                                      plotAreaBorderWidth: 0,
                                      primaryXAxis: const CategoryAxis(
                                        majorGridLines:
                                            MajorGridLines(width: 0),
                                        labelPlacement: LabelPlacement.onTicks,
                                      ),
                                      primaryYAxis: const NumericAxis(
                                        minimum: 0,
                                        maximum: 80,
                                        axisLine: AxisLine(width: 0),
                                        edgeLabelPlacement:
                                            EdgeLabelPlacement.shift,
                                        labelFormat: '{value}K',
                                        majorTickLines:
                                            MajorTickLines(size: 0),
                                      ),
                                      series: visitSplineSeriesData,
                                      tooltipBehavior:
                                          TooltipBehavior(enable: true),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                // ... Rest of your code ...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
