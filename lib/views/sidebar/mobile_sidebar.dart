import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/sidebar_item.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class MobileSidebar extends StatelessWidget {
  SideBarController sideBarController;
  MobileSidebar({Key? key, required this.sideBarController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkColor,
        child: Column(
          children: [
            SizedBox(height: 4.h),
            Image.asset("assets/images/dashboard-logo.png",
                height: 10.h, width: 20.w),
            SizedBox(height: 4.h),
            const Divider(thickness: 2, color: kDarkLightColor),
            SizedBox(height: 6.h),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    title: sideBarController.namesList[index],
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: false,
                    press: () {
                      Get.back();
                      sideBarController.onSelected(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
