import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/AuthController.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/dashboard/dashboard_view.dart';
import 'package:frontend_grounda/views/login/login_view.dart';
import 'package:get/get.dart';
// import 'package:live_streaming_app/utils/constants.dart';
// import '../views/dashboard/dashbord_view.dart';
// import '../views/login/login_view.dart';

class InitialNavigation extends GetView<AuthController> {
  InitialNavigation({Key? key}) : super(key: key);
  final isLoading = true.obs;
  @override
  Widget build(BuildContext context) {
    if (controller.auth.currentUser == null) {
      isLoading.value = true;
    } else {
      isLoading.value = false;
    }
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: controller.auth.currentUser != null
            ? const DashboardView()
            : const LoginView());
  }
}
