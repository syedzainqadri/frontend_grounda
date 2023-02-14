import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Custom Text Styles Class For Both Dark and Light Theme
class CustomTextTheme {
  //! Default Font is GoogleFonts.Ubuntu You can change it as your Need

  ThemeChangeController controller = Get.put(ThemeChangeController());

  static const _textColorLight = Color(0xFF000000);
  // Light Theme Default Text Color
  static const _textColorDark =
      Color(0xFFFFFFFF); // Light Theme Default Text Color

  TextTheme get textThemeLight {
    return _textTheme(textColor: _textColorLight);
  }

  TextTheme get textThemeDark {
    return _textTheme(textColor: _textColorDark);
  }

  // Private Method For Text Theme so that we can change the vale for Both Dark And Light Theme
  TextTheme _textTheme({required Color textColor}) {
    const FontWeight light = FontWeight.w300;
    const FontWeight medium = FontWeight.w500;
    const FontWeight regular = FontWeight.w400;

    return TextTheme(
      displayLarge: GoogleFonts.ubuntu(
        fontSize: 58,
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontWeight: light,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 42,
        fontWeight: light,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 48,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      headlineMedium: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 34,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      headlineSmall: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 24,
        fontWeight: regular,
        letterSpacing: 0.0,
      ),
      titleLarge: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 20,
        fontWeight: medium,
        letterSpacing: 0.15,
      ),
      bodyLarge: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 18,
        fontWeight: regular,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 16,
        fontWeight: regular,
        letterSpacing: 0.25,
      ),
      labelLarge: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 14,
        fontWeight: medium,
        letterSpacing: 1.25,
      ),
      bodySmall: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 12,
        fontWeight: regular,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.ubuntu(
        color: controller.isDarkMode.value ? _textColorDark : _textColorLight,
        fontSize: 10,
        fontWeight: regular,
        letterSpacing: 1.5,
      ),
    );
  }
}
