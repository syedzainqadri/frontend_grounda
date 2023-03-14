import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:get/get.dart';

class ProductPageDesktop extends GetView<ThemeChangeController> {
  const ProductPageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.isDarkMode.value = !controller.isDarkMode.value;
              print(controller.isDarkMode.value);
            },
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      body: Container(
        child: const Center(
          child: Text('CustomerPage'),
        ),
      ),
    );
  }
}
