// ignore_for_file: must_be_immutable, use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/amenitiesController/amenities_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/icon_from_api.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class AmenitiesPageDesktop extends GetView<ThemeChangeController> {
  AmenitiesPageDesktop({super.key});

  final TextEditingController searchPaymentMethod = TextEditingController();
  final AmenitiesController amenitiesController =
      Get.find<AmenitiesController>();
  TextEditingController amenityTitleController = TextEditingController();

  var isPublished = false.obs;
  var amenityId = ''.obs;
  var icon = 57487.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Amenities'),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .25,
                decoration: BoxDecoration(
                  color:
                      controller.isDarkMode.value ? kDarkCardColor : kCardColor,
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
                child: const Padding(
                  padding: EdgeInsets.all(25.0),
                  // child: AmenitiesForm(
                  //   iconPicker: IconPicker(
                  //     style: TextStyle(
                  //       color: controller.isDarkMode.value
                  //           ? kDarkTextColor
                  //           : kTextColor,
                  //     ),
                  //     initialValue: 'Please Select an Icon',
                  //     icon: Icon(
                  //       IconData(icon.value, fontFamily: iconFontFamily.value),
                  //       color: controller.isDarkMode.value
                  //           ? kDarkTextColor
                  //           : kTextColor,
                  //     ),
                  //     labelText: "Icon",
                  //     title: "Select an icon",
                  //     cancelBtn: "CANCEL",
                  //     enableSearch: true,
                  //     searchHint: 'Search icon',
                  //     onChanged: (val) {
                  //       var value = jsonDecode(val);
                  //       icon.value = value['codePoint'];
                  //       print(icon.value);
                  //     },
                  //   ),
                  //   amenityTitleController: amenityTitleController,
                  //   buttonText: amenityId.value == '' ? 'Submit' : 'Update',
                  //   formSubmit: () async {
                  //     if (amenityId.value == '') {
                  //       Get.defaultDialog(
                  //         title: 'Creating Amenity',
                  //         content: const Center(
                  //           child:
                  //               CircularProgressIndicator(color: kPrimaryColor),
                  //         ),
                  //       );
                  //       await amenitiesController.create(
                  //           amenityTitleController.text,
                  //           icon.value.toString(),
                  //           isPublished.value);
                  //       await amenitiesController.getAll();
                  //       Navigator.pop(context);
                  //     } else {
                  //       Get.defaultDialog(
                  //         title: 'Updating Amenity',
                  //         content: const Center(
                  //           child:
                  //               CircularProgressIndicator(color: kPrimaryColor),
                  //         ),
                  //       );
                  //       await amenitiesController.updateAmenities(
                  //         int.parse(amenityId.value),
                  //         amenityTitleController.text,
                  //         icon.value.toString(),
                  //         isPublished.value,
                  //       );
                  //       amenityTitleController.text = '';
                  //       icon.value = 57487;
                  //       amenityId.value = '';
                  //       await amenitiesController.getAll();
                  //       Navigator.pop(context);
                  //     }
                  //   },
                  //   cancelText: amenityId.value == '' ? '' : 'Cancel Update',
                  //   onTap: () async {
                  //     amenityTitleController.text = '';
                  //     icon.value = 57487;
                  //     amenityId.value = '';
                  //     await amenitiesController.getAll();
                  //   },
                  //   statusValue: isPublished.value,
                  //   statusChanges: (value) {
                  //     isPublished.value = value;
                  //   },
                  // ),
                
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
                      controller.isDarkMode.value ? kDarkCardColor : kCardColor,
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
                              textEditingController: searchPaymentMethod,
                              hintText: "Search Amenity",
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
                        child: amenitiesController.amenities.isEmpty
                            ? const Offstage()
                            : ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: amenitiesController.amenities.length,
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
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        IconFromApi(
                                                          icon:
                                                              amenitiesController
                                                                  .amenities[
                                                                      index]
                                                                  .icon!,
                                                        ),
                                                        Text(
                                                          amenitiesController
                                                              .amenities[index]
                                                              .name!,
                                                          style:
                                                              Theme.of(context)
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
                                                              style: TextStyle(
                                                                color: controller
                                                                        .isDarkMode
                                                                        .value
                                                                    ? kDarkTextColor
                                                                    : kTextColor,
                                                              ),
                                                            ),
                                                            amenitiesController
                                                                    .amenities[
                                                                        index]
                                                                    .status!
                                                                ? Text(
                                                                    "Active",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodySmall!
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.green),
                                                                  )
                                                                : Text(
                                                                    'UnPublished',
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .bodySmall!
                                                                        .copyWith(
                                                                            color:
                                                                                Colors.red),
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
                                                      amenityTitleController
                                                              .text =
                                                          amenitiesController
                                                              .amenities[index]
                                                              .name!;
                                                      icon.value = int.parse(
                                                          amenitiesController
                                                              .amenities[index]
                                                              .icon!);

                                                      isPublished.value =
                                                          amenitiesController
                                                              .amenities[index]
                                                              .status!;

                                                      amenityId.value =
                                                          amenitiesController
                                                              .amenities[index]
                                                              .id
                                                              .toString();
                                                    },
                                                    icon: SvgPicture.asset(
                                                      "assets/icons/edit.svg",
                                                      color: controller
                                                              .isDarkMode.value
                                                          ? kDarkTextColor
                                                          : kTextColor,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 20,
                                                  ),
                                                  IconButton(
                                                    onPressed: () async {
                                                      Get.defaultDialog(
                                                        title:
                                                            'Deleting Amenity',
                                                        content: const Center(
                                                          child: CircularProgressIndicator(
                                                              color:
                                                                  kPrimaryColor),
                                                        ),
                                                      );
                                                      await amenitiesController
                                                          .delete(
                                                              amenitiesController
                                                                  .amenities[
                                                                      index]
                                                                  .id!);
                                                      await amenitiesController
                                                          .getAll();
                                                      Navigator.pop(context);
                                                    },
                                                    icon: SvgPicture.asset(
                                                      "assets/icons/trash.svg",
                                                      color: controller
                                                              .isDarkMode.value
                                                          ? kDarkTextColor
                                                          : kTextColor,
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
