// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/Buttons.dart';

class SettingsMenuCard extends GetView<ThemeChangeController> {
  SettingsMenuCard(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.text,
      required this.onPressed});

  final double height;
  final double width;
  String text;
  String icon;
  dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: controller.isDarkMode.value ? kDarkCardColor : kCardColor,
          child: SizedBox(
            height: height * 0.1,
            width: width * .8,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        icon,
                        color: controller.isDarkMode.value
                            ? kWhiteColor
                            : kDarkCardColor,
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: controller.isDarkMode.value
                              ? kWhiteColor
                              : kDarkCardColor,
                        ),
                      ),
                    ],
                  ),
                  DefaultButton(
                      primaryColor: kPrimaryColor,
                      hoverColor: kDarkCardColor,
                      buttonText: 'Edit',
                      onPressed: onPressed,
                      width: width * .05,
                      height: height * .03)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
