import 'package:flutter/material.dart';
import 'package:frontend_grounda/bindings/all_bindings.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/root_view.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SideBarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      title: ProjectName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootView(),
    );
  }
}
