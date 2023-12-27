// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:frontend_grounda/controllers/agencyController/agency_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

class AgencyPage extends GetView<ThemeChangeController> {
  AgencyPage({super.key});
  TextEditingController agencySearchController = TextEditingController();
  AgencyController agencyController = Get.find<AgencyController>();
  var selectedItemId = 0.obs;
  var isPublished = false.obs;
  var hasInstallments = false.obs;
  var posessionReady = false.obs;
  var catId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Agencies'),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .8,
                decoration: BoxDecoration(
                  color:
                      controller.isDarkMode.value ? kDarkCardColor : kCardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: controller.isDarkMode.value
                          ? kDarkShadowColor.withOpacity(.2)
                          : kShadowColor.withOpacity(.2),
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
                              textEditingController: agencySearchController,
                              hintText: "Search Agency",
                              labelText: "Search",
                              isPassword: false,
                              suffixIcon:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                          DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkCardColor,
                            buttonText: "Create Agency",
                            width: width * .12,
                            height: height * .05,
                            onPressed: () {
                              Get.toNamed('/agency/create');
                            },
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
                          itemCount: agencyController.agencies.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: controller.isDarkMode.value
                                  ? kDarkBgColor
                                  : kBgColor,
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
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: agencyController
                                                              .agencies[index]
                                                              .logoImage !=
                                                          null
                                                      ? Image.network(
                                                          agencyController
                                                              .agencies[index]
                                                              .logoImage!)
                                                      : SvgPicture.asset(
                                                          '/images/logo.svg',
                                                          fit: BoxFit.cover,
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    agencyController
                                                        .agencies[index].title!,
                                                    style: TextStyle(
                                                      color: controller
                                                              .isDarkMode.value
                                                          ? kWhiteColor
                                                          : kDarkCardColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Status: ",
                                                        style: TextStyle(
                                                          color: controller
                                                                  .isDarkMode
                                                                  .value
                                                              ? kWhiteColor
                                                              : kDarkCardColor,
                                                        ),
                                                      ),
                                                      agencyController
                                                                  .agencies[
                                                                      index]
                                                                  .status ==
                                                              true
                                                          ? Text(
                                                              "Active",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .green),
                                                            )
                                                          : Text(
                                                              'UnPublished',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .red),
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
                                              onPressed: () async {
                                                //Todo: please add edit function
                                                Get.toNamed('/agency/create');
                                                agencyController.getbyId(
                                                  agencyController
                                                      .agencies[index].id
                                                      .toString(),
                                                );
                                              },
                                              icon: SvgPicture.asset(
                                                "assets/icons/edit.svg",
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kWhiteColor
                                                        : kDarkCardColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                agencyController.delete(
                                                  agencyController
                                                      .agencies[index].id
                                                      .toString(),
                                                );
                                              },
                                              icon: SvgPicture.asset(
                                                "assets/icons/trash.svg",
                                                color:
                                                    controller.isDarkMode.value
                                                        ? kWhiteColor
                                                        : kDarkCardColor,
                                              ),
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
      ),
    );
  }
}
