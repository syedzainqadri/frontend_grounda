import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/authController/auth_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/login/login_view.dart';
import 'package:frontend_grounda/views/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class InitialNavigation extends GetView<AuthController> {
  InitialNavigation({Key? key}) : super(key: key);
  final Box<dynamic> tokenHiveBox = Hive.box('token');
  @override
  Widget build(BuildContext context) {
    var token = tokenHiveBox.get('token');
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: token != null ? const DashboardView() : LoginView());
  }
}
