// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

class DefaultTextField extends GetView<ThemeChangeController> {
  DefaultTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    required this.textEditingController,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.maxLength,
    this.maxLines,
    this.onFieldSubmitted,
    this.autofocus,
    this.focusNode,
  });
  dynamic validator;
  dynamic onFieldSubmitted;
  String hintText;
  String labelText;
  int? maxLength;
  int? maxLines;
  bool isPassword;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextEditingController? textEditingController;
  bool? autofocus;
  FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      maxLines: maxLines,
      autofocus: autofocus ?? false,
      maxLength: maxLength,
      validator: validator,
      controller: textEditingController,
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor:
            controller.isDarkMode.value ? kDarkTextColor : kTextColor,
        prefixIcon: prefixIcon,
        prefixIconColor:
            controller.isDarkMode.value ? kDarkTextColor : kTextColor,
        hintStyle: TextStyle(
          color: controller.isDarkMode.value ? kDarkTextColor : kTextColor,
        ),
        hintText: hintText,
        label: Text(
          labelText,
          style: TextStyle(
            color: controller.isDarkMode.value ? kDarkTextColor : kTextColor,
          ),
        ),
        fillColor: controller.isDarkMode.value ? kDarkFillColor : kFillColor,
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
