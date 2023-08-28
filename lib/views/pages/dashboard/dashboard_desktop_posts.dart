import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/dashboardController/dashboard_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/visits_data.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
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
    bool isMobile = width < kScreenWidthThreshold;

    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Posts'),
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isMobile)
                  Column(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed('/allpost'),
                        child: DashboardTotalCountWidget(
                          title: "Total Posts",
                          subTitle: "Current month",
                          width: width,
                          totalCount: dashboardController.totalPostCount.value,
                          color: kPrimaryColor,
                          isMobile: isMobile,
                        ),
                      ),
                      const SizedBox(height: 16),
                      DashboardTotalCountWidget(
                        title: "Published Posts",
                        subTitle: "Current month",
                        width: width,
                        totalCount:
                            dashboardController.totalPublishedPostCount.value,
                        color: kPrimaryColor,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 16),
                      DashboardTotalCountWidget(
                        title: "Pending",
                        subTitle: "Current month",
                        width: width,
                        totalCount:
                            dashboardController.totalPendingPostCount.value,
                        color: kPrimaryColor,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                if (!isMobile)
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.toNamed('/allpost'),
                        child: DashboardTotalCountWidget(
                          title: "Total Posts",
                          subTitle: "Current month",
                          width: width,
                          totalCount: dashboardController.totalPostCount.value,
                          color: kPrimaryColor,
                          isMobile: isMobile,
                        ),
                      ),
                      SizedBox(width: width * .03),
                      DashboardTotalCountWidget(
                        title: "Published Posts",
                        subTitle: "Current month",
                        width: width,
                        totalCount:
                            dashboardController.totalPublishedPostCount.value,
                        color: kPrimaryColor,
                        isMobile: isMobile,
                      ),
                      SizedBox(width: width * .03),
                      DashboardTotalCountWidget(
                        title: "Pending",
                        subTitle: "Current month",
                        width: width,
                        totalCount:
                            dashboardController.totalPendingPostCount.value,
                        color: kPrimaryColor,
                        isMobile: isMobile,
                      ),
                    ],
                  ),
                const SizedBox(height: 24),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: controller.isDarkMode.value
                        ? kDarkCardColor
                        : kCardColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
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
                        labelPlacement: LabelPlacement.onTicks,
                      ),
                      primaryYAxis: NumericAxis(
                        minimum: 0,
                        maximum: 80,
                        axisLine: const AxisLine(width: 0),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        labelFormat: '{value}K',
                        majorTickLines: const MajorTickLines(size: 0),
                      ),
                      series: visitSplineSeriesData,
                      tooltipBehavior: TooltipBehavior(enable: true),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: controller.isDarkMode.value
                        ? kDarkCardColor
                        : kCardColor,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(20),
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
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            if (!isMobile)
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
                                  const SizedBox(height: 20),
                                  Text(
                                    "Studio flat for sale in\nKorangi Karachi",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  ),
                                ],
                              ),
                            if (!isMobile)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(height: 20),
                                  Text(
                                    "Flat",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  ),
                                ],
                              ),
                            if (!isMobile)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(height: 20),
                                  Text(
                                    "9 Jun, 2023",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  ),
                                ],
                              ),
                            if (!isMobile)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                  const SizedBox(height: 20),
                                  Text(
                                    "Ajmal Khan",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.isDarkMode.value
                                          ? kCardColor
                                          : kDarkCardColor,
                                    ),
                                  ),
                                ],
                              ),
                          ],
                        ),
                        if (isMobile)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Text(
                                "Title",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kPrimaryColor
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Studio flat for sale in\nKorangi Karachi",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kCardColor
                                      : kDarkCardColor,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Category",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kPrimaryColor
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Flat",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kCardColor
                                      : kDarkCardColor,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Date Posted",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kPrimaryColor
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "9 Jun, 2023",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kCardColor
                                      : kDarkCardColor,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                "Posted By",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kPrimaryColor
                                      : Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "Ajmal Khan",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: controller.isDarkMode.value
                                      ? kCardColor
                                      : kDarkCardColor,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const double kScreenWidthThreshold = 600;
