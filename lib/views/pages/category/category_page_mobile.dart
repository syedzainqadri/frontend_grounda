import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:get/get.dart';

class CategoryPageMobile extends GetView<ThemeChangeController> {
  const CategoryPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    const bool isMobile = true;
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 50, bottom: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(),
        ],
      ),
    );
  }
}
