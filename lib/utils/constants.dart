import 'package:flutter/material.dart';
import 'package:get/get.dart';

const kMainColor = Color.fromARGB(255, 170, 3, 156);
const kBrightColor = Colors.white;
const kDarkColor = Color(0xFF404553);
const kDarkLightColor = Color(0x96404553);
const kFadedColor = Color(0xffF7F6F2);
const kRedColor = Colors.red;

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, .1),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 255, 255, 1),
};
MaterialColor kPrimaryColor = MaterialColor(0xFFFEEE00, color);

//global variables

Rxn<bool> isSigned = Rxn<bool>();
Rxn<String> userID = Rxn<String>();
Rxn<String> visitUserID = Rxn<String>();
Rx<bool> isLoading = false.obs;
Rx<bool> isFirstLoad = true.obs;
