import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/sidebar_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/sidebar_item.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TabletSidebar extends StatelessWidget {
  SideBarController sideBarController;
  TabletSidebar({Key? key, required this.sideBarController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: kDarkColor,
        child: Column(
          children: [
            const SizedBox(height: 4),
            Image.asset("assets/images/dashboard-logo.png",
                height: 6, width: 10),
            const SizedBox(height: 2),
            const Divider(thickness: 2, color: kDarkLightColor),
            const SizedBox(height: 4),
            Expanded(
              child: ListView.builder(
                itemCount: sideBarController.iconsList.length,
                itemBuilder: (context, index) {
                  return SidebarItem(
                    svgSrc: sideBarController.iconsList[index],
                    isTablet: true,
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
