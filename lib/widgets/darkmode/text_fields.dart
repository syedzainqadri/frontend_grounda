// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

class DefaultTextField extends GetView<ThemeChangeController> {
  DefaultTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    this.suffixIcon,
    this.prefixIcon,
  });

  String hintText;
  String labelText;
  bool isPassword;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: controller.isDarkMode.value ? kWhiteColor : kDarkColor,
        prefixIcon: prefixIcon,
        prefixIconColor: controller.isDarkMode.value ? kWhiteColor : kDarkColor,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: hintText,
        label: Text(
          labelText,
          style: TextStyle(
              color: controller.isDarkMode.value ? kDarkColor : kWhiteColor),
        ),
        fillColor: controller.isDarkMode.value ? kDarkColor : kInputBgColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: controller.isDarkMode.value
              ? const BorderSide(color: kPrimaryColor, width: 2.0)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
