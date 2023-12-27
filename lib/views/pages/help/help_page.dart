import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

class HelpPage extends GetView<ThemeChangeController> {
  HelpPage({super.key});

  TextEditingController searchController = TextEditingController();
  bool isMobile = false;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    bool isMobile = width < 600; // Adjust this value as needed

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DashBoardAppBar(title: 'Tickets'),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                child: isMobile
                    ? Align(
                        alignment: AlignmentDirectional.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            DefaultButton(
                              primaryColor: kPrimaryColor,
                              hoverColor: kDarkCardColor,
                              buttonText: "Create Tickets",
                              width: width * .4,
                              height: height * .05,
                              onPressed: () {
                                //Todo: Activate this when this page is build
                                // Get.toNamed('/order/create');
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomSlidingSegmentedControl<int>(
                              initialValue: 1,
                              children: const {
                                1: Text('Day'),
                                2: Text('Week'),
                                3: Text('Month'),
                              },
                              height: 23,
                              decoration: BoxDecoration(
                                color: kCardColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              thumbDecoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.3),
                                    blurRadius: 4.0,
                                    spreadRadius: 1.0,
                                    offset: const Offset(
                                      0.0,
                                      2.0,
                                    ),
                                  ),
                                ],
                              ),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInToLinear,
                              onValueChanged: (v) {
                                print(v);
                              },
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkCardColor,
                            buttonText: "Create Tickets",
                            width: width * .12,
                            height: height * .05,
                            onPressed: () {
                              //Todo: Activate this when this page is build
                              // Get.toNamed('/order/create');
                            },
                          ),
                          CustomSlidingSegmentedControl<int>(
                            initialValue: 1,
                            children: const {
                              1: Text('Day'),
                              2: Text('Week'),
                              3: Text('Month'),
                            },
                            height: 23,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            thumbDecoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.3),
                                  blurRadius: 4.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(
                                    0.0,
                                    2.0,
                                  ),
                                ),
                              ],
                            ),
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInToLinear,
                            onValueChanged: (v) {
                              print(v);
                            },
                          ),
                        ],
                      ),
              ),
              isMobile
                  ? Column(
                      children: [
                        //! Main Container 1
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .83,
                            width: width * .7,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("2nd Thursday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile
                                              ? width * .2
                                              : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),

                        //! Main Container 2

                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .83,
                            width: width * .7,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("2nd Thursday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile
                                              ? width * .2
                                              : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                        //! Main Container 3

                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .83,
                            width: width * .7,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("2nd Thursday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile
                                              ? width * .2
                                              : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: isMobile
                                              ? height * .2
                                              : height * .16,
                                          width: isMobile
                                              ? width * .6
                                              : width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height: isMobile
                                                                ? height * .04
                                                                : height * .04,
                                                            width: isMobile
                                                                ? width * .05
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        //! Main Container 1
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .75,
                            width: isMobile ? width : width * .20,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("2nd Thursday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile ? width : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Signup Problem",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Unable to login",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),

                        //! Main Container 2
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .75,
                            width: isMobile ? width : width * .20,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("3rd Friday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile ? width : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Ads not posting",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Payment Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Can i get a refund",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),

                        //! Main Container 3
                        Padding(
                          padding: const EdgeInsets.only(left: 50, top: 25),
                          child: Container(
                            height: height * .75,
                            width: isMobile ? width : width * .20,
                            decoration: BoxDecoration(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: controller.isDarkMode.value
                                      ? kDarkShadowColor.withOpacity(.2)
                                      : kShadowColor.withOpacity(.5),
                                ),
                              ],
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.only(top: 25, left: 30),
                                        child: Text("2nd Thursday"),
                                      ),
                                      //Todo: Black Container
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 30),
                                        child: Container(
                                          height: height * .005,
                                          width: isMobile ? width : width * .1,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.black,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      // Todo: Ticket 1
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Post Sharing Issue",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                      // Todo: Ticket 2
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Image Not Uploading",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),

                                      // Todo: Ticket 3
                                      const SizedBox(
                                        height: 12,
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20, left: 25),
                                        child: Container(
                                          height: height * .17,
                                          width: width * .17,
                                          decoration: BoxDecoration(
                                            color: controller.isDarkMode.value
                                                ? kDarkCardColor
                                                : Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(20),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kDarkShadowColor
                                                            .withOpacity(.2)
                                                        : kShadowColor
                                                            .withOpacity(.5),
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 10, left: 10),
                                                  child: Text(
                                                    "11:00 AM - 11:30 AM",
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.grey),
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 3, left: 10),
                                                  child: Text(
                                                    "Open Discussion",
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30,
                                                          left: 8,
                                                          right: 18),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          //Todo: Container 1
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Icon(
                                                              Icons.send,
                                                              size: 14,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 2
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "AM",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                          const SizedBox(
                                                            width: 3,
                                                          ),
                                                          //Todo: Container 3
                                                          Container(
                                                            height:
                                                                height * .04,
                                                            width: isMobile
                                                                ? width
                                                                : width * .022,
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              color: controller
                                                                      .isDarkMode
                                                                      .value
                                                                  ? kDarkCardColor
                                                                  : Colors
                                                                      .white,
                                                              borderRadius:
                                                                  const BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: controller
                                                                          .isDarkMode
                                                                          .value
                                                                      ? kDarkShadowColor
                                                                          .withOpacity(
                                                                              .2)
                                                                      : kShadowColor
                                                                          .withOpacity(
                                                                              .5),
                                                                ),
                                                              ],
                                                            ),
                                                            child: const Center(
                                                                child: Text(
                                                              "ES",
                                                              style: TextStyle(
                                                                  fontSize: 10),
                                                            )),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        width: 5,
                                                      ),
                                                      //Todo: Attachements
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets
                                                                    .only(
                                                                left: 5,
                                                                top: 13),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: [
                                                            Icon(
                                                              Icons.attach_file,
                                                              size: 10,
                                                            ),
                                                            Text(
                                                              "10 attachements",
                                                              style: TextStyle(
                                                                  fontSize: 9,
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    ),
              // !
            ],
          ),
        ),
      ),
    );
  }
}
