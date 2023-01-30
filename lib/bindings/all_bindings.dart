import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:get/instance_manager.dart';

class AllBindings implements Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<SideBarController>(() => SideBarController());
  }
}
