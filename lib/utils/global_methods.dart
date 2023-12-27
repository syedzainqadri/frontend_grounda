import 'package:flutter/material.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

showSuccessSnack(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.check,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.green,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}

showErrorSnack(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.dangerous,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.red,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}

showDeleteSnack(String title, String message) {
  Get.snackbar(
      icon: const Icon(
        Icons.delete,
        color: kWhiteColor,
      ),
      title,
      message,
      colorText: kDarkTextColor,
      snackPosition: SnackPosition.TOP,
      maxWidth: 600,
      backgroundColor: Colors.deepOrange,
      snackStyle: SnackStyle.FLOATING,
      shouldIconPulse: true);
}
