import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  RxString title = "Events List".obs;
  var width = 0.0.obs;

  final List<String> iconsList = [
    "assets/icons/dashboard.svg",
    "assets/icons/customer-list.svg",
    "assets/icons/category-list.svg",
    "assets/icons/post-list.svg",
    "assets/icons/project-list.svg",
    "assets/icons/agency-list.svg",
    "assets/icons/developer-list.svg",
    "assets/icons/product-list.svg",
    "assets/icons/order-list.svg",
    "assets/icons/blog-list.svg",
    "assets/icons/forum-list.svg",
    "assets/icons/support-list.svg",
    "assets/icons/setting.svg",
    "assets/icons/logout.svg",
  ];
  final List<String> namesList = [
    'Dashboard',
    "Customers",
    "Category",
    "Posts",
    "Project",
    "Agency",
    "Developer",
    "Product",
    "Order",
    "Blog",
    "Forum",
    "Tickets",
    "setting",
    "Logout",
  ];

  final _pageController = PageController().obs;
  var show = false.obs;
  PageController get pageController => _pageController.value;

  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  onSelected(int index) {
    switch (index) {
      case 0:
        Get.toNamed('/dashboard');
        break;
      case 1:
        Get.toNamed('/customer');
        break;
      case 2:
        Get.toNamed('/category');
        break;
      case 3:
        Get.toNamed('/desktop-post');
        break;
      case 4:
        Get.toNamed('/project');
        break;
      case 5:
        Get.toNamed('/agency');
        break;
      case 6:
        Get.toNamed('/developer');
        break;
      case 7:
        Get.toNamed('/product');
        break;
      case 8:
        Get.toNamed('/desktop-order');
        break;
      case 9:
        Get.toNamed('/blog');
        break;
      case 10:
        Get.toNamed('/forum');
        break;
      case 11:
        Get.toNamed('/help');
        break;
      case 12:
        Get.toNamed('/settings');
        break;
      case 13:
        Get.toNamed('/login');
        break;
    }
    _pageController.value.jumpToPage(index);
    _pageController.value = pageController;
  }

  // void controlMenu() {
  //   if (scaffoldKey.currentState!.isDrawerOpen) {
  //     scaffoldKey.currentState!.openDrawer();
  //   }
  // }

  changeName(String value) {
    title(value).obs;
  }
}
