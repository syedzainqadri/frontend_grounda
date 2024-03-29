// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/developerController/developer_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/developerModel.dart/developer_model.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/developer/developer_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class DeveloperPageDesktop extends GetView<ThemeChangeController> {
  DeveloperPageDesktop({super.key});

  final TextEditingController searchDeveloperController =
      TextEditingController();
  final DeveloperController developerController =
      Get.find<DeveloperController>();
  QuillEditorController descriptionControllerDeveloperPage =
      QuillEditorController();
  TextEditingController developerNameController = TextEditingController();

  TextEditingController categoryStatusController = TextEditingController();
  List<DevelopersModel> developersModel = [];
  final _developerFormKey = GlobalKey<FormState>();

  var selectedItemId = 0.obs;
  var status = false.obs;
  var devId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Obx(
      () => Scaffold(
        backgroundColor: controller.isDarkMode.value ? kDarkBgColor : kBgColor,
        appBar: DashBoardAppBar(title: 'Developers'),
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
                          ? kDarkShadowColor.withOpacity(.2)
                          : kShadowColor.withOpacity(.2),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: _developerFormKey,
                    child: DeveloperForm(
                      developerNameController: developerNameController,
                      nameValidator: (value) {
                        if (value == null || value == '') {
                          return 'Post title cannot be empty';
                        }
                      },
                      descriptionController: descriptionControllerDeveloperPage,
                      buttonText: devId.value == '' ? 'Submit' : 'Update',
                      formSubmit: () async {
                        if (_developerFormKey.currentState!.validate()) {
                          if (devId.value == '') {
                            Get.defaultDialog(
                              title: 'Creating Developer',
                              content: const Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              ),
                            );
                            var description =
                                await descriptionControllerDeveloperPage
                                    .getText();
                            await developerController.create(
                                developerNameController.text,
                                description,
                                developerController.logo.value,
                                status.value);
                            await developerController.getAll();
                            Navigator.pop(context);
                          } else {
                            Get.defaultDialog(
                              title: 'Updating Developer',
                              content: const Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              ),
                            );
                            var description =
                                await descriptionControllerDeveloperPage
                                    .getText();
                            await developerController.updateDeveloper(
                                int.parse(devId.value),
                                developerNameController.text,
                                description,
                                developerController.logo.value,
                                status.value);
                            developerNameController.text = '';
                            descriptionControllerDeveloperPage.clear();
                            selectedItemId.value = 0;
                            devId.value = '';
                            await developerController.getAll();
                            Navigator.pop(context);
                          }
                        }
                      },
                      cancelText: devId.value == '' ? '' : 'Cancel Update',
                      onTap: () async {
                        developerNameController.text = '';
                        developerController.logo.value = '';
                        descriptionControllerDeveloperPage.clear();
                        selectedItemId.value = 0;
                        devId.value = '';
                        await developerController.getAll();
                      },
                      pictureButtonText: developerController.logo.value.isEmpty
                          ? 'Add Logo'
                          : 'Update Logo',
                      uploadImages: () async {
                        Get.defaultDialog(
                          title: 'Uploading Image',
                          content: const Center(
                            child:
                                CircularProgressIndicator(color: kPrimaryColor),
                          ),
                        );
                        await developerController.getDeveloperLogo();
                        Navigator.pop(context);
                      },
                      statusValue: status.value,
                      statusChanges: (value) {
                        status.value = value;
                      },
                    ),
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
                              textEditingController: searchDeveloperController,
                              hintText: "Search Developers",
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
                          itemCount: developerController.developers.length,
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
                                                  child: developerController
                                                              .developers[index]
                                                              .logo !=
                                                          null
                                                      ? Image.network(
                                                          developerController
                                                              .developers[index]
                                                              .logo!)
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
                                                    developerController
                                                        .developers[index]
                                                        .title!,
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
                                                      developerController
                                                                  .developers[
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
                                                descriptionControllerDeveloperPage
                                                    .clear();
                                                developerNameController.text =
                                                    developerController
                                                        .developers[index]
                                                        .title!;
                                                descriptionControllerDeveloperPage
                                                    .insertText(
                                                        developerController
                                                            .developers[index]
                                                            .description!);
                                                status.value =
                                                    developerController
                                                        .developers[index]
                                                        .status!;

                                                devId.value =
                                                    developerController
                                                        .developers[index].id
                                                        .toString();
                                                developerController.logo.value =
                                                    developerController
                                                        .developers[index]
                                                        .logo!;
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
                                                Get.defaultDialog(
                                                  title: 'Deleting Developer',
                                                  content: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                kPrimaryColor),
                                                  ),
                                                );
                                                await developerController
                                                    .delete(developerController
                                                        .developers[index].id!);
                                                await developerController
                                                    .getAll();
                                                Navigator.pop(context);
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
