import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/category/category_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class CategoryPageDesktop extends GetView<ThemeChangeController> {
  CategoryPageDesktop({super.key});

  final TextEditingController searchCategory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Category'),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * .8,
              width: width * .25,
              decoration: BoxDecoration(
                color:
                    controller.isDarkMode.value ? kDarkFrameColor : kFrameColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: controller.isDarkMode.value
                        ? kDarkShadowColor.withOpacity(.9)
                        : kShadowColor.withOpacity(.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: CategoryForm(),
              ),
            ),
            SizedBox(
              width: width * .03,
            ),
            Container(
              height: height * .8,
              width: width * .5,
              decoration: BoxDecoration(
                color:
                    controller.isDarkMode.value ? kDarkFrameColor : kFrameColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: controller.isDarkMode.value
                        ? kDarkShadowColor.withOpacity(.9)
                        : kShadowColor.withOpacity(.5),
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * .45,
                          child: DefaultTextField(
                            textEditingController: searchCategory,
                            hintText: "Search Category",
                            labelText: "Search",
                            isPassword: false,
                            suffixIcon:
                                SvgPicture.asset('assets/icons/search.svg'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * .05,
                    ),
                    SizedBox(
                      height: height * .6,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: 20,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: controller.isDarkMode.value
                                ? kDarkCardColor
                                : kCardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: width * .06,
                                            child: CircleAvatar(
                                              backgroundColor: kWhiteColor,
                                              radius: 30,
                                              child: Center(
                                                child: SvgPicture.asset(
                                                  '/images/logo.svg',
                                                  fit: BoxFit.cover,
                                                  height: 40,
                                                  width: 40,
                                                ),
                                              ),
                                            ),
                                            // child: CircleAvatar(
                                            //   radius: 30.0,
                                            //   backgroundColor: kDarkCardColor,
                                            //   child: Image.asset(
                                            //     "assets/images/dashboard-logo.png",
                                            //     fit: BoxFit.cover,
                                            //   ),
                                            // ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Buy A Centrally Located 1 Kanal House In Shah Jamal",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Status: ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall,
                                                    ),
                                                    Text(
                                                      "Active",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall!
                                                          .copyWith(
                                                              color:
                                                                  Colors.green),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                "assets/icons/edit.svg"),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: SvgPicture.asset(
                                                "assets/icons/trash.svg"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
