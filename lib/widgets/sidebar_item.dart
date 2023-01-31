import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/values_manager.dart';
import 'package:get/get.dart';

class SidebarItem extends GetView<ThemeChangeController> {
  const SidebarItem(
      {Key? key,
      this.title,
      required this.svgSrc,
      required this.press,
      required this.isTablet})
      : super(key: key);
  final String? title;
  final String svgSrc;
  final VoidCallback press;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    return isTablet
        ? ListTile(
            onTap: press,
            leading: SvgPicture.asset(svgSrc, color: kPrimaryColor, height: 15))
        : ListTile(
            onTap: press,
            horizontalTitleGap: AppSize.s0,
            leading: SvgPicture.asset(svgSrc, color: kPrimaryColor, height: 15),
            title: Text(
              title!,
              style: TextStyle(
                color: controller.isDarkMode.value ? kBrightColor : kDarkColor,
                fontSize: 16,
              ),
            ),
          );
  }
}
