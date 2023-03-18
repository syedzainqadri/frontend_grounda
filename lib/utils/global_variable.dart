import 'package:get/get.dart';

RxBool show = false.obs;
//api endpoints
RxString pid = ''.obs;
String baseUrl = 'https://starfish-app-mfjab.ondigitalocean.app';
String createUser = '/auth/register';
String userLogin = '/auth/login';
String allUsers = '/users/';
String createProfile = '/profile/createProfile';
String profileById = '/profile/';
String deleteProfile = '/profile/deleteProfile';
// RxBool themeMode = ThemeChangeController().isDarkMode;
