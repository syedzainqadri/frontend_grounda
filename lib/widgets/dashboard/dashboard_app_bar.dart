import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

class DashBoardAppBar extends GetView<ThemeChangeController>
    implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  DashBoardAppBar({super.key, required this.title})
      : preferredSize = const Size.fromHeight(50.0);

  final String title;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    return Obx(
      () => AppBar(
        leading: const Offstage(),
        backgroundColor:
            controller.isDarkMode.value ? kDarkCardColor : kCardColor,
        title: SizedBox(
          width: width * .75,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: width * .2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 27.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: controller.isDarkMode.value
                          ? kWhiteColor
                          : kDarkCardColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width < 1010 ? width * .2 : width * .3,
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: DefaultTextField(
                    textEditingController: searchController,
                    hintText: "Search",
                    labelText: "",
                    isPassword: false,
                    suffixIcon: const Icon(
                      Icons.search,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/message-notification.svg',
                color:
                    controller.isDarkMode.value ? kWhiteColor : kDarkCardColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/notification.svg',
                color:
                    controller.isDarkMode.value ? kWhiteColor : kDarkCardColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/person.svg',
                color:
                    controller.isDarkMode.value ? kWhiteColor : kDarkCardColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Transform.scale(
              scale: .7,
              child: CupertinoSwitch(
                  activeColor: kPrimaryColor,
                  value: controller.isDarkMode.value,
                  onChanged: (val) {
                    controller.isDarkMode.value = val;
                  }),
            ),
          )
        ],
      ),
    );
  }
}
