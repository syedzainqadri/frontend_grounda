import 'package:get/get.dart';

RxBool show = false.obs;
//api endpoints
RxString token = ''.obs;
String baseUrl = 'https://starfish-app-mfjab.ondigitalocean.app';
String createUser = '/auth/register';
String userLogin = '/auth/login';
String allUsers = '/users/';
String createProfile = '/profile/createProfile';
// RxBool themeMode = ThemeChangeController().isDarkMode;
