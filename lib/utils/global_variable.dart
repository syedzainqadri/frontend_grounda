import 'package:get/get.dart';

RxBool show = false.obs;
//api endpoints
RxString pid = ''.obs;
//String baseUrl = 'https://starfish-app-mfjab.ondigitalocean.app';
String baseUrl = 'http://127.0.0.1:8080';
String createUser = '/auth/register';
String userLogin = '/auth/login';
String allUsers = '/users/';
String createProfile = '/profile/createProfile';
String updateProfile = '/profile/updateProfile';
String profileById = '/profile/';
String deleteProfile = '/profile/deleteProfile/';
String allCategory = '/category/';
String createCategory = '/category/createCategory';
String deleteCategory = '/category/deleteCategory/';
String updateCategory = '/category/updateCategory';
String getAllPost = '/post';
String createPost = '/createPost';
// RxBool themeMode = ThemeChangeController().isDarkMode;
