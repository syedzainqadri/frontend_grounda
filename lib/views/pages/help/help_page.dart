import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:get/get.dart';

class HelpPage extends GetView<ThemeChangeController> {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              controller.isDarkMode.value = !controller.isDarkMode.value;
            },
            icon: const Icon(Icons.lightbulb),
          ),
        ],
      ),
      body: const Center(
        child: Text('HelpPage'),
      ),
    );
  }
}
