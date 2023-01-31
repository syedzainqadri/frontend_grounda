import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/AuthController.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/root_view.dart';
import 'package:get/get.dart';

class InitialNavigation extends GetView<AuthController> {
  const InitialNavigation({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: controller.auth.currentUser != null
            ? const RootView()
            : LoginView());
  }
}
