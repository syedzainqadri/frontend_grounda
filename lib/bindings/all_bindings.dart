import 'package:frontend_grounda/controllers/menuController.dart/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/profileController.dart/profile_controller.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_controller.dart';
import 'package:get/instance_manager.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeChangeController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut<SideBarController>(() => SideBarController());
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
  }
}
