// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DashboardSmallWidget extends GetView<ThemeChangeController> {
  DashboardSmallWidget(
      {super.key,
      required this.title,
      required this.subTitle,
      required this.width,
      required this.percentage,
      required this.svgIconPath,
      required this.color,
      required this.isMobile});

  dynamic width;
  dynamic percentage;
  String title;
  String subTitle;
  String svgIconPath;
  Color color;
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isMobile ? width : width * .25,
      decoration: BoxDecoration(
        color: controller.isDarkMode.value ? kDarkCardColor : kCardColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            blurRadius: 2,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  svgIconPath,
                  color: kPrimaryColor,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      subTitle,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                SizedBox(
                  width: isMobile ? width * .4 : width * .1,
                  height: 140,
                  child: SfRadialGauge(
                    axes: <RadialAxis>[
                      RadialAxis(
                        labelsPosition: ElementsPosition.inside,
                        maximum: 100,
                        startAngle: 180,
                        endAngle: 360,
                        showFirstLabel: false,
                        showLabels: false,
                        showTicks: false,
                        axisLineStyle: const AxisLineStyle(thickness: 30),
                        // radiusFactor: .7,
                        canScaleToFit: true,
                        annotations: [
                          GaugeAnnotation(
                              verticalAlignment: GaugeAlignment.far,
                              positionFactor: .2,
                              widget: Text("$percentage%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall)),
                        ],
                        pointers: <GaugePointer>[
                          RangePointer(
                            width: 30,
                            value: percentage.toDouble(),
                            color: color,
                            enableAnimation: true,
                            animationDuration: 250,
                            animationType: AnimationType.easeInCirc,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
