import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/bindings/all_bindings.dart';
import 'package:frontend_grounda/controllers/AuthController.dart';
import 'package:frontend_grounda/firebase_options.dart';
import 'package:frontend_grounda/services/navigationService.dart';
import 'package:frontend_grounda/theme/theme.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'controllers/theme_change_controller.dart';
import 'controllers/theme_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox('settings');
  Get.put(AuthController());
  Get.put(ThemeController());
  Get.put(ThemeChangeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController _themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllBindings(),
      debugShowCheckedModeBanner: false,
      themeMode: _themeController.themeStateFromHiveSettingBox,
      title: ProjectName,
      initialRoute: '/',
      getPages: appRoutes(),
      theme: CustomTheme().lightTheme,
      darkTheme: CustomTheme().darkTheme,
    );
  }
}
