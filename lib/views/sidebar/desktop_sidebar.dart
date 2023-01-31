import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/sidebar_item.dart';
import 'package:sizer/sizer.dart';

class DesktopSidebar extends StatelessWidget {
  final SideBarController sideBarController;
  const DesktopSidebar({Key? key, required this.sideBarController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkColor,
        child: Column(
          children: [
            const SizedBox(height: 4),
            Image.asset("assets/images/dashboard-logo.png",
                height: 10, width: 20),
            const SizedBox(height: 4),
            const Divider(thickness: 2, color: kDarkLightColor),
            const SizedBox(height: 6),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    title: sideBarController.namesList[index],
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: false,
                    press: () {
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
