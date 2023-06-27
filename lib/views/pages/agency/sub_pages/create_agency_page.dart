import 'dart:convert';

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/agencyController/agency_controller.dart';
import 'package:frontend_grounda/controllers/authController/auth_controller.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/maps.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CreateAgency extends GetView<ThemeChangeController> {
  CreateAgency({super.key});

  ScrollController scrollController =
      ScrollController(initialScrollOffset: 00.0);
  AgencyController agencyController = Get.find<AgencyController>();
  CategoryController categoryController = Get.find<CategoryController>();
  AuthController authController = Get.find<AuthController>();
  var height = Get.height;
  var width = Get.width;

  RxList<String> agencyCategory = RxList.empty(growable: true);
  var indexs = [].obs;
  var purposeList = ''.obs;
  var categoryList = ''.obs;
  RxInt selectedIndex = 0.obs;
  var purpose = [].obs;
  RxBool isObsecure = true.obs;
  bool isSelected(index, List indexs, List agencyCategory) {
    if (indexs.contains(index)) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Agency'),
      body: Center(
        child: Container(
          height: height * .8,
          width: width * .8,
          decoration: BoxDecoration(
            color: controller.isDarkMode.value ? kDarkFrameColor : kFrameColor,
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
            padding: const EdgeInsets.only(
              bottom: 25.0,
              top: 10,
              right: 20,
              left: 20,
            ),
            child: Obx(
              () => Row(
                children: [
                  //form
                  SizedBox(
                    width: width * .2,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Focus(
                        focusNode: agencyController.formFocus,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(
                                        48), // Image radius
                                    child: agencyController.logo.value == ''
                                        ? CircleAvatar(
                                            backgroundColor: kDarkCardColor,
                                            child: IconButton(
                                              icon: const Icon(Icons.add),
                                              onPressed: () {
                                                Get.defaultDialog(
                                                  title: 'Uploading Image',
                                                  content: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                kPrimaryColor),
                                                  ),
                                                  barrierDismissible: false,
                                                );
                                                agencyController
                                                    .getAgencyLogo();
                                                Navigator.pop(context);
                                              },
                                            ))
                                        : InkWell(
                                            onTap: () {
                                              Get.defaultDialog(
                                                title: 'Uploading Image',
                                                content: const Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: kPrimaryColor),
                                                ),
                                                barrierDismissible: false,
                                              );
                                              agencyController.getAgencyLogo();
                                              Navigator.pop(context);
                                            },
                                            child: Image.network(
                                                agencyController.logo.value,
                                                fit: BoxFit.cover),
                                          ),
                                  ),
                                ),
                              ),
                              DefaultTextField(
                                autofocus: true,
                                maxLength: 22,
                                hintText: 'Name',
                                labelText: 'Name',
                                isPassword: false,
                                textEditingController:
                                    agencyController.agencyNameController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(
                                      agencyController
                                          .agencyOwnerNameFieldFocus);
                                },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return 'Agency Name cannot be empty';
                                  }
                                },
                              ),
                              DefaultTextField(
                                maxLength: 50,
                                hintText: 'Agency Owner Name',
                                labelText: 'Agency Owner Name',
                                isPassword: false,
                                textEditingController:
                                    agencyController.agencyOwnerNameController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(
                                      agencyController.agencyEmailFieldFocus);
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value == '' ||
                                      !GetUtils.isWord(value)) {
                                    return 'Name cannot be empty';
                                  }
                                },
                              ),
                              DefaultTextField(
                                maxLength: 50,
                                hintText: 'Agency Email',
                                labelText: 'Agency Email',
                                isPassword: false,
                                textEditingController:
                                    agencyController.agencyEmailController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(
                                      agencyController.agencyPhoneFieldFocus);
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value == '' ||
                                      !GetUtils.isEmail(value)) {
                                    return 'Email cannot be empty';
                                  }
                                },
                              ),
                              DefaultTextField(
                                maxLength: 14,
                                hintText: 'Agency Phone',
                                labelText: 'Agency Phone',
                                isPassword: false,
                                textEditingController:
                                    agencyController.agencyPhoneController,
                                onFieldSubmitted: (value) {
                                  FocusScope.of(context).requestFocus(
                                      agencyController
                                          .agencyPasswordFieldFocus);
                                },
                                validator: (value) {
                                  if (value == null ||
                                      value == '' ||
                                      !GetUtils.isPhoneNumber(value)) {
                                    return 'Phone Nummber cannot be empty';
                                  }
                                },
                              ),
                              DefaultTextField(
                                maxLength: 14,
                                hintText: 'Password',
                                labelText: 'Password',
                                isPassword: isObsecure.value,
                                maxLines: 1,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    isObsecure.value =
                                        isObsecure.value ? false : true;
                                  },
                                  icon: isObsecure.value
                                      ? const Icon(Icons.password)
                                      : const Icon(Icons.remove_red_eye),
                                  // icon: const Icon(Icons.remove_red_eye),
                                ),
                                textEditingController:
                                    agencyController.agencyPasswordController,
                                // onFieldSubmitted: (value) {
                                //   FocusScope.of(context).requestFocus(
                                //       agencyController.agencyNameFieldFocus);
                                // },
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return 'Password cannot be empty';
                                  }
                                },
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              Container(
                                height: height * .17,
                                width: width * .2,
                                decoration: const BoxDecoration(
                                  color: kWhiteColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20.0, left: 20.0),
                                      child: Text(
                                        'Purpose',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: CheckboxListTile(
                                        title: Text(
                                          'Sell',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        value: agencyController.sell.value,
                                        onChanged: (value) {
                                          agencyController.sell.value = value!;
                                        },
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: CheckboxListTile(
                                        title: Text(
                                          'Rent',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        value: agencyController.rent.value,
                                        onChanged: (value) {
                                          agencyController.rent.value = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height * .02,
                              ),
                              DefaultButton(
                                primaryColor: kPrimaryColor,
                                hoverColor: kPrimaryColor,
                                buttonText: 'Create',
                                onPressed: () async {
                                  if (agencyController.sell.value == true) {
                                    purpose.add('sell');
                                  }
                                  if (agencyController.rent.value == true) {
                                    purpose.add('rent');
                                  }
                                  if (purpose.isNotEmpty) {
                                    purposeList.value = jsonEncode(purpose);
                                  }
                                  if (agencyCategory.isNotEmpty) {
                                    categoryList.value =
                                        jsonEncode(agencyCategory);
                                  }
                                  var description = agencyController
                                      .htmlEditorController
                                      .getText();
                                  await authController
                                      .registerUser(
                                          agencyController
                                              .agencyEmailController.text,
                                          agencyController
                                              .agencyPasswordController.text,
                                          'AGENCY')
                                      .then((value) {
                                    agencyController.create(
                                      agencyController
                                          .agencyNameController.text,
                                      agencyController
                                          .agencyOwnerNameController.text,
                                      description.toString(),
                                      agencyController.logo.value,
                                      agencyController.banner.value,
                                      agencyController
                                          .agencyEmailController.text,
                                      agencyController
                                          .agencyPhoneController.text,
                                      agencyController
                                          .agencyAddressController.text,
                                      agencyController.country.value,
                                      agencyController.state.value,
                                      agencyController.city.value,
                                      purposeList.value,
                                      categoryList.value,
                                      authController.userModel.value.id!,
                                      agencyController
                                              .agencyNameController.text +
                                          agencyController
                                              .agencyOwnerNameController.text,
                                    );
                                  });
                                },
                                width: width * 2,
                                height: height * 0.08,
                              ),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(20),
                              //     color: controller.isDarkMode == true
                              //         ? kDarkCardColor
                              //         : kCardColor,
                              //   ),
                              //   child: Padding(
                              //     padding:
                              //         const EdgeInsets.symmetric(horizontal: 8.0),
                              //     child: DropdownButton(
                              //       borderRadius: BorderRadius.circular(15),
                              //       hint: const Text("Select Post Type"),
                              //       isExpanded: true,
                              //       value: selectedValue,
                              //       icon: const Icon(Icons.arrow_downward),
                              //       elevation: 16,
                              //       style: Theme.of(context).textTheme.bodyMedium,
                              //       underline: Container(
                              //         height: 2,
                              //         color: Colors.transparent,
                              //       ),
                              //       onChanged: (value) {},
                              //       items: dropdownItems,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  //right side
                  Scrollbar(
                    controller: scrollController,
                    thumbVisibility: false,
                    trackVisibility: false,
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * .26,
                                height: height * .2,
                                decoration: BoxDecoration(
                                  image: agencyController.logo == ''
                                      ? const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              'assets/images/mountains.webp'),
                                        )
                                      : DecorationImage(
                                          image: NetworkImage(
                                              agencyController.banner.value),
                                        ),
                                  color: kDarkCardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    agencyController.getAgencyBanner();
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width * .02,
                              ),
                              Container(
                                  width: width * .26,
                                  height: height * .2,
                                  decoration: BoxDecoration(
                                    color: kDarkCardColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: agencyController.latitude.value == 0
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                          color: kPrimaryColor,
                                        ))
                                      : GoogleMap(
                                          lang:
                                              agencyController.longitude.value,
                                          lat: agencyController.latitude.value,
                                        )),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          Row(
                            children: [
                              Container(
                                width: width * .26,
                                height: height * .3,
                                decoration: BoxDecoration(
                                  color: kCardColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: HtmlEditor(
                                  htmlToolbarOptions: const HtmlToolbarOptions(
                                    defaultToolbarButtons: [
                                      FontSettingButtons(),
                                      ColorButtons(),
                                      ListButtons(),
                                    ],
                                    toolbarItemHeight: 30,
                                    toolbarType: ToolbarType.nativeExpandable,
                                  ),
                                  controller: agencyController
                                      .htmlEditorController, //required
                                  htmlEditorOptions: const HtmlEditorOptions(
                                    autoAdjustHeight: true,
                                    androidUseHybridComposition: true,
                                    hint: "Your Description here...",
                                    //initalText: "text content initial, if any",
                                  ),
                                  otherOptions: const OtherOptions(
                                    height: 350,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * .02,
                              ),
                              //TODO: Replace with address details
                              Column(
                                children: [
                                  SizedBox(
                                    width: width * .26,
                                    child: SelectState(
                                      onCountryChanged: (String value) {
                                        agencyController.country.value = value;
                                      },
                                      onCityChanged: (String value) {
                                        agencyController.state.value = value;
                                      },
                                      onStateChanged: (String value) {
                                        agencyController.city.value = value;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .26,
                                    child: DefaultTextField(
                                      hintText: 'Address',
                                      labelText: 'Please Enter Agency Address',
                                      isPassword: false,
                                      textEditingController: agencyController
                                          .agencyAddressController,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * .02,
                          ),
                          //TODO: Replace with list of categories and sub categories respectively
                          Container(
                            width: width * .54,
                            height: height * .25,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding:
                                      EdgeInsets.only(top: 20.0, left: 20.0),
                                  child: Text('Property Type'),
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),
                                SizedBox(
                                  width: width * .5,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Wrap(
                                      spacing: width * .005,
                                      runSpacing: width * .01,
                                      children: List.generate(
                                        categoryController.category.length,
                                        (index) {
                                          return InputChip(
                                            backgroundColor: isSelected(index,
                                                    indexs, agencyCategory)
                                                ? Theme.of(context).primaryColor
                                                : const Color(0xFF3E5561),
                                            avatar: isSelected(index, indexs,
                                                    agencyCategory)
                                                ? const Icon(
                                                    Icons.check_box_rounded,
                                                    size: 20,
                                                  )
                                                : const Icon(Icons.add),
                                            label: Text(
                                              categoryController
                                                  .category[index].name!,
                                              style: isSelected(index, indexs,
                                                      agencyCategory)
                                                  ? const TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold)
                                                  : TextStyle(
                                                      fontSize: 20,
                                                      color:
                                                          Colors.blueGrey[100],
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            onSelected: (bool value) {
                                              selectedIndex.value = index;
                                              (indexs.contains(index)
                                                  ? indexs.remove(index)
                                                  : indexs.add(index));
                                              (agencyCategory.contains(
                                                      categoryController
                                                          .category[index].name)
                                                  ? agencyCategory.remove(
                                                      categoryController
                                                          .category[index]
                                                          .name!)
                                                  : agencyCategory.add(
                                                      categoryController
                                                          .category[index]
                                                          .name!));
                                              print(agencyCategory);
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
