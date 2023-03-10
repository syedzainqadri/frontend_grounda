import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/controllers/theme_controller.dart';
import 'package:get/instance_manager.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeChangeController());
    Get.lazyPut(() => ThemeController());
    Get.lazyPut<SideBarController>(() => SideBarController());
  }
}
