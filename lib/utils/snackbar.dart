import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';

errorSnackbar(title, message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: kRedColor,
    colorText: kBrightColor,
  );
}

successSnackbar(title, message) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: kPrimaryColor,
    colorText: kBrightColor,
  );
}
