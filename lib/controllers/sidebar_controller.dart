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
    "Help",
    "setting",
    "Logout",
  ];

  final _pageController = PageController().obs;
  var show = false.obs;
  PageController get pageController => _pageController.value;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  onSelected(int index) {
    _pageController.value.jumpToPage(index);
    _pageController.value = pageController;
  }

  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  changeName(String value) {
    title(value).obs;
  }
}
