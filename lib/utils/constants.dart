import 'package:flutter/material.dart';
import 'package:get/get.dart';

// const kMainColor = Color.fromARGB(255, 170, 3, 156);
// const kBrightColor = Colors.white;
const kWhiteColor = Color.fromARGB(255, 229, 229, 229);
const kRedColor = Colors.red;
const kPrimaryColor = Color(0xffBC902D);
const kSecondryColor = Color.fromRGBO(242, 201, 76, 1);
const kAdditionalColor = Color.fromRGBO(153, 108, 251, 1);

// const kGoldenColor = Color(0xffF2C94C);
const kShadowColor = Color(0XFFCCCCCC);
const kFillColor = Colors.white;
const kLabelColor = Color(0XFF333333);
// const kFrameColor = Color(0XFFF8F8F8);
const kCardColor = Color(0xffF7F6F2);
const kTextColor = Color.fromARGB(255, 0, 0, 0);
const kBgColor = Colors.white;
const kListColor = Colors.white60;

// Dark Theme
const kDarkBgColor = Color.fromARGB(255, 95, 95, 102);
// const kDarkFrameColor = Color.fromARGB(255, 106, 108, 115);
const kDarkLightColor = Color(0xFF4a4e5e);
const kDarkShadowColor = Color.fromARGB(255, 0, 0, 0);
const kDarkTextColor = Color.fromARGB(255, 255, 255, 255);
const kDarkCardColor = Color(0xFF4a4e5e);
const kDarkFillColor = Colors.grey;
const kDarkListColor = Colors.black54;
// responsive

// font Size
//h1
const double titleOneSize = 56.0;
const double headingOneSize = 48.0;
const double headingTwoSize = 38.0;
const double headingThreeSize = 32.0;
const double headingFourSize = 26.0;
const double headingFiveSize = 20.0;
const double headingSixSize = 16.0;

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
// MaterialColor kPrimaryColor = MaterialColor(0xFFFEEE00, color);

//global variables

Rxn<bool> isSigned = Rxn<bool>();
RxString userID = "".obs;
Rxn<String> visitUserID = Rxn<String>();
Rx<bool> isLoading = false.obs;
Rx<bool> isFirstLoad = true.obs;

const projectName = "Gharounda.pk";
