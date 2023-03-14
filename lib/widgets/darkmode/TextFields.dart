import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

class DefaultTextField extends GetView<ThemeChangeController> {
  DefaultTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.isPassword,
      this.suffixIcon,
      this.prefixIcon,
      this.isMultiLine});

  String hintText;
  String labelText;
  bool isPassword;
  bool? isMultiLine;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      textInputAction:
          isMultiLine == true ? TextInputAction.newline : TextInputAction.none,
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
        fillColor: controller.isDarkMode.value ? kDarkColor : kInputBgGrayColor,
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
