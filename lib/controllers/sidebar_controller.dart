import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideBarController extends GetxController {
  RxString title = "Events List".obs;
  var width = 0.0.obs;

  final List<String> iconsList = [
    "assets/icon/dashboard.svg",
    "assets/icon/customer-list.svg",
    "assets/icon/category-list.svg",
    "assets/icon/post-list.svg",
    "assets/icon/project-list.svg",
    "assets/icon/agency-list.svg",
    "assets/icon/developer-list.svg",
    "assets/icon/product-list.svg",
    "assets/icon/order-list.svg",
    "assets/icon/blog-list.svg",
    "assets/icon/forum-list.svg",
    "assets/icon/support-list.svg",
    "assets/icon/setting.svg",
    "assets/icon/logout.svg",
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
    "Logout",
  ];

  // @override
  // void onInit() {
  //   width.value = Get.width;
  //   // TODO: implement onInit
  //   super.onInit();
  // }

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
