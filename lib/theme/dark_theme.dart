import 'package:flutter/material.dart';
import 'package:frontend_grounda/theme/text_theme.dart';

import '../utils/constants.dart';

// ignore: non_constant_identifier_names
ThemeData DarkThemeData() {
  return ThemeData(
    primaryColor: kDarkColor,
    brightness: Brightness
        .dark, //Setting the Brightness to Dark  so that this can be used as Dark ThemeData
    scaffoldBackgroundColor: Colors.black,
    splashColor: Colors.grey,
    textTheme:
        CustomTextTheme.textThemeDark, //Setting the Text Theme to DarkTextTheme

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      iconTheme: IconThemeData(color: Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color.fromARGB(255, 24, 23, 23),
      selectedIconTheme: IconThemeData(
        color: Colors.white,
      ),
      unselectedIconTheme: IconThemeData(color: Colors.blueGrey),
    ),
    //! You Can Set All Your Custom Dark Theme Here
  );
}
