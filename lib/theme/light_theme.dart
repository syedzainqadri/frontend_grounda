import 'package:flutter/material.dart';
import 'package:frontend_grounda/theme/text_theme.dart';
import 'package:frontend_grounda/utils/constants.dart';

// ignore: non_constant_identifier_names
ThemeData LightThemeData() {
  return ThemeData(
    primaryColor: kBrightColor,
    brightness: Brightness
        .light, //Setting the Brightness to light  so that this can be used as Light ThemeData
    scaffoldBackgroundColor: Colors.white,
    splashColor: Colors.orange,
    textTheme: CustomTextTheme
        .textThemeLight, //Setting the Text Theme to LightTextTheme

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.deepOrange,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      enableFeedback: true,
      backgroundColor: Colors.white,
      selectedIconTheme: IconThemeData(
        color: Colors.deepOrange,
      ),
      unselectedIconTheme: IconThemeData(color: Colors.black),
    ),
  );
}
