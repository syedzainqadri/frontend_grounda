// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/projectController/projectNearByPlaces_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/utils/global_variable.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/project_near_by_places/project_near_by_places_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/icon_from_api.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';
import 'package:icon_picker/icon_picker.dart';

class ProjectNearByPlacesDesktop extends GetView<ThemeChangeController> {
  ProjectNearByPlacesDesktop({super.key});

  final TextEditingController searchPaymentMethod = TextEditingController();
  final TextEditingController projectNearByPlacesTitleController =
      TextEditingController();
  final ProjectNearByPlacesController projectNearByPlacesController =
      ProjectNearByPlacesController();

  var isPublished = false.obs;
  var projectNearByPlaceId = ''.obs;
  var icon = 57487.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Project Near By Places'),
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
                  child: ProjectNearByPlacesForm(
                    iconPicker: IconPicker(
                      initialValue: 'Please Select an Icon',
                      icon: Icon(
                        IconData(icon.value, fontFamily: iconFontFamily.value),
                      ),
                      labelText: "Icon",
                      title: "Select an icon",
                      cancelBtn: "CANCEL",
                      enableSearch: true,
                      searchHint: 'Search icon',
                      onChanged: (val) {
                        var value = jsonDecode(val);
                        icon.value = value['codePoint'];
                        print(icon.value);
                      },
                    ),
                    projectPlaceTitleController:
                        projectNearByPlacesTitleController,
                    buttonText:
                        projectNearByPlaceId.value == '' ? 'Submit' : 'Update',
                    formSubmit: () async {
                      if (projectNearByPlaceId.value == '') {
                        Get.defaultDialog(
                          title: 'Creating Project Place',
                          content: const Center(
                            child:
                                CircularProgressIndicator(color: kPrimaryColor),
                          ),
                        );
                        await projectNearByPlacesController.create(
                            projectNearByPlacesTitleController.text,
                            icon.value.toString(),
                            isPublished.value);
                        await projectNearByPlacesController.getAll();
                        Navigator.pop(context);
                      } else {
                        Get.defaultDialog(
                          title: 'Updating Amenity',
                          content: const Center(
                            child:
                                CircularProgressIndicator(color: kPrimaryColor),
                          ),
                        );
                        await projectNearByPlacesController
                            .updateProjectNearByPlaces(
                          int.parse(projectNearByPlaceId.value),
                          projectNearByPlacesTitleController.text,
                          icon.value.toString(),
                          isPublished.value,
                        );
                        projectNearByPlacesTitleController.text = '';
                        icon.value = 57487;
                        projectNearByPlaceId.value = '';
                        await projectNearByPlacesController.getAll();
                        Navigator.pop(context);
                      }
                    },
                    cancelText:
                        projectNearByPlaceId.value == '' ? '' : 'Cancel Update',
                    onTap: () async {
                      projectNearByPlacesTitleController.text = '';
                      icon.value = 57487;
                      projectNearByPlaceId.value = '';
                      await projectNearByPlacesController.getAll();
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
                        child:
                            projectNearByPlacesController
                                    .projectNearByPlaces.isEmpty
                                ? const Offstage()
                                : ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    itemCount: projectNearByPlacesController
                                        .projectNearByPlaces.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            IconFromApi(
                                                              icon: projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .icon!,
                                                            ),
                                                            Text(
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .name!,
                                                              style: Theme.of(
                                                                      context)
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
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .bodySmall,
                                                                ),
                                                                projectNearByPlacesController
                                                                        .projectNearByPlaces[
                                                                            index]
                                                                        .status!
                                                                    ? Text(
                                                                        "Active",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodySmall!
                                                                            .copyWith(color: Colors.green),
                                                                      )
                                                                    : Text(
                                                                        'UnPublished',
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .bodySmall!
                                                                            .copyWith(color: Colors.red),
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
                                                          projectNearByPlacesTitleController
                                                                  .text =
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .name!;
                                                          icon.value = int.parse(
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .icon!);

                                                          isPublished.value =
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .status!;

                                                          projectNearByPlaceId
                                                                  .value =
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .id
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
                                                            title:
                                                                'Deleting Project Place',
                                                            content:
                                                                const Center(
                                                              child: CircularProgressIndicator(
                                                                  color:
                                                                      kPrimaryColor),
                                                            ),
                                                          );
                                                          await projectNearByPlacesController.delete(
                                                              projectNearByPlacesController
                                                                  .projectNearByPlaces[
                                                                      index]
                                                                  .id!);
                                                          await projectNearByPlacesController
                                                              .getAll();
                                                          Navigator.pop(
                                                              context);
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
