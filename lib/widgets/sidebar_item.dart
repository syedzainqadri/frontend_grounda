import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';

import 'package:get/get.dart';

class SidebarItem extends GetView<ThemeChangeController> {
  const SidebarItem(
      {super.key,
      this.title,
      required this.svgSrc,
      required this.press,
      required this.isTablet});
  final String? title;
  final String svgSrc;
  final VoidCallback press;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return isTablet
        ? ListTile(
            onTap: press,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgPicture.asset(
                svgSrc,
                color: kPrimaryColor,
                height: 15,
              ),
            ))
        : ListTile(
            onTap: press,
            horizontalTitleGap: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: SvgPicture.asset(
                svgSrc,
                color: kPrimaryColor,
                height: 15,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                title!,
                //style: Theme.of(context).textTheme.bodyMedium,
                style: TextStyle(
                  color: controller.isDarkMode.value
                      ? kWhiteColor
                      : kDarkCardColor,
                  fontSize: 16,
                ),
              ),
            ),
          );
  }
}
