// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/amenitiesController/amenities_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/amenetiesModel/ameneties_model.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/amenities/amenities_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class AmenitiesPageDesktop extends GetView<ThemeChangeController> {
  AmenitiesPageDesktop({super.key});

  final TextEditingController searchPaymentMethod = TextEditingController();
  final AmenitiesController amenitiesController =
      Get.find<AmenitiesController>();
  TextEditingController amenityTitleController = TextEditingController();
  TextEditingController amenityDescriptionController = TextEditingController();
  List<AmenitiesModel> allamenitiesModel = [];

  var selectedItemId = 0.obs;
  var isPublished = false.obs;
  var amenityId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Amenities'),
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .25,
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
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
                  child: amenitiesController.amenities.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : AmenitiesForm(
                          amenityTitleController: amenityTitleController,
                          amenityDescriptionController:
                              amenityDescriptionController,
                          iconButtonText: "Upload Icon",
                          iconImageUrl: amenitiesController.iconImageUrl.value,
                          onIconPress: () {
                            Get.defaultDialog(
                              barrierDismissible: false,
                              title: 'Uploading Amenity Icon',
                              content: const Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              ),
                            );
                            amenitiesController.getIcon();
                            Navigator.pop(context);
                          },
                          buttonText:
                              amenityId.value == '' ? 'Submit' : 'Update',
                          formSubmit: () async {
                            if (amenityId.value == '') {
                              Get.defaultDialog(
                                title: 'Creating Amenity',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );

                              await amenitiesController.create(
                                  amenityTitleController.text,
                                  amenityDescriptionController.text,
                                  amenitiesController.iconImageUrl.value,
                                  isPublished.value);
                              await amenitiesController.getAll();
                              Navigator.pop(context);
                            } else {
                              Get.defaultDialog(
                                title: 'Updating Amenity',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );

                              await amenitiesController.updateAmenities(
                                int.parse(amenityId.value),
                                amenityTitleController.text,
                                amenityDescriptionController.text,
                                amenitiesController.iconImageUrl.value,
                                isPublished.value,
                              );
                              amenityTitleController.text = '';
                              amenityDescriptionController.text = '';
                              amenitiesController.iconImageUrl.value = '';
                              amenityId.value = '';
                              await amenitiesController.getAll();
                              Navigator.pop(context);
                            }
                          },
                          cancelText:
                              amenityId.value == '' ? '' : 'Cancel Update',
                          onTap: () async {
                            amenityTitleController.text = '';
                            amenityDescriptionController.text = '';
                            amenitiesController.iconImageUrl.value = '';
                            selectedItemId.value = 0;
                            amenityId.value = '';
                            await amenitiesController.getAll();
                          },
                          statusValue: isPublished.value,
                          statusChanges: (value) {
                            isPublished.value = value;
                          },
                        ),
                ),
              ),
              SizedBox(
                width: width * .03,
              ),
              Container(
                height: height * .8,
                width: width * .5,
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
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
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: amenitiesController.amenities.length,
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
                                                    amenitiesController
                                                        .amenities[index].name!,
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
                                                      amenitiesController
                                                              .amenities[index]
                                                              .status!
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
                                                amenityTitleController.text =
                                                    amenitiesController
                                                        .amenities[index].name!;

                                                amenityDescriptionController
                                                        .text =
                                                    amenitiesController
                                                        .amenities[index]
                                                        .description!;

                                                amenitiesController
                                                        .iconImageUrl.value =
                                                    amenitiesController
                                                        .amenities[index].icon!;

                                                isPublished.value =
                                                    amenitiesController
                                                        .amenities[index]
                                                        .status!;

                                                amenityId.value =
                                                    amenitiesController
                                                        .amenities[index].id
                                                        .toString();
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                Get.defaultDialog(
                                                  title: 'Deleting Category',
                                                  content: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                kPrimaryColor),
                                                  ),
                                                );
                                                await amenitiesController
                                                    .delete(amenitiesController
                                                        .amenities[index].id!);
                                                await amenitiesController
                                                    .getAll();
                                                Navigator.pop(context);
                                              },
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
      ),
    );
  }
}
