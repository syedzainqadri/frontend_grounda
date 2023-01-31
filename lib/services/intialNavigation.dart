import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/AuthController.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/root_view.dart';
import 'package:get/get.dart';

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
        body: controller.auth.currentUser != null ? RootView() : LoginView());
  }
}
