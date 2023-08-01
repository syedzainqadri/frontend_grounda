// ignore_for_file: must_be_immutable

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:get/get.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ProjectForm extends GetView<ThemeChangeController> {
  ProjectForm(
      {required this.projectTitleController,
      required this.projectAddressController,
      required this.projectLocalityController,
      required this.categoryDropDownList,
      required this.categoryDropDownValue,
      required this.categoryOnChange,
      required this.developerDropDownValue,
      required this.developerOnChange,
      required this.developerDropDownList,
      required this.statusChanges,
      required this.formSubmit,
      required this.statusValue,
      required this.uploadImages,
      required this.buttonText,
      required this.pictureButtonText,
      required this.cancelText,
      required this.onTap,
      required this.cityController,
      required this.areaController,
      required this.startingPriceController,
      required this.endingPriceController,
      required this.htmlEditorController,
      required this.walkThroughController,
      required this.images,
      // validation
      required this.projectTitleValidator,
      required this.cityValidator,
      required this.areaValidator,
      required this.startingPriceValidator,
      required this.endingPriceValidator,
      required this.walkThroughFieldSubmitted,

      // focus node
      required this.titleFieldSubmitted,
      required this.titleFocus,
      required this.projectAddressFocus,
      required this.projectLocalityFocus,
      required this.cityFocus,
      required this.cityFieldSubmitted,
      required this.walkThroughFocus,
      required this.walkThroughValidator,
      required this.projectNearByPlaces,
      required this.selectedProjectNearByPlaces,
      super.key});
  double width = Get.width;
  double height = Get.height;

  String categoryDropDownValue;
  dynamic categoryOnChange;
  List<DropdownMenuItem<String>> categoryDropDownList;

  String developerDropDownValue;
  dynamic developerOnChange;
  List<DropdownMenuItem<String>> developerDropDownList;

  dynamic statusChanges;
  dynamic formSubmit;
  dynamic uploadImages;
  dynamic onTap;
  dynamic projectTitleValidator;
  dynamic projectAddressValidator;
  dynamic cityValidator;
  dynamic areaValidator;
  dynamic propertyAreaValidator;

  dynamic plotNumberValidator;
  dynamic bathroomValidator;
  dynamic bedroomValidator;
  dynamic noOfInstallmentValidator;
  dynamic monthlyInstallmentValidator;
  dynamic advanceValidator;
  dynamic endingPriceValidator;
  dynamic walkThroughValidator;

  bool statusValue;

  String buttonText;
  String pictureButtonText;
  String cancelText;

  dynamic propertyAreaUnitOnChange;
  dynamic startingPriceValidator;
  dynamic titleFieldSubmitted;
  dynamic projectAddressFieldSubmitted;
  dynamic cityFieldSubmitted;
  dynamic walkThroughFieldSubmitted;

  TextEditingController projectTitleController;
  TextEditingController projectLocalityController;
  TextEditingController projectAddressController;
  TextEditingController walkThroughController;
  TextEditingController cityController;
  TextEditingController areaController;
  TextEditingController startingPriceController;
  TextEditingController endingPriceController;
  HtmlEditorController htmlEditorController;

  Widget images;
  Widget projectNearByPlaces;
  Widget? selectedProjectNearByPlaces;

  FocusNode titleFocus;
  FocusNode projectLocalityFocus;
  FocusNode projectAddressFocus;
  FocusNode cityFocus;
  FocusNode walkThroughFocus;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height * 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Project",
                style: TextStyle(
                    color:
                        controller.isDarkMode.value ? kWhiteColor : kDarkColor),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                textEditingController: projectTitleController,
                focusNode: titleFocus,
                onFieldSubmitted: titleFieldSubmitted,
                hintText: "Enter Project Title",
                labelText: "Project Title",
                isPassword: false,
                validator: projectTitleValidator,
                maxLength: 200,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                textEditingController: projectLocalityController,
                focusNode: projectLocalityFocus,
                onFieldSubmitted: titleFieldSubmitted,
                hintText: "Project Locality",
                labelText: "Project Locality",
                isPassword: false,
                validator: projectAddressValidator,
                maxLength: 200,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                focusNode: projectAddressFocus,
                onFieldSubmitted: projectAddressFieldSubmitted,
                hintText: "Project Address",
                labelText: "Project Address",
                isPassword: false,
                textEditingController: projectAddressController,
                validator: projectTitleValidator,
                maxLength: 200,
              ),
              SizedBox(
                height: height * 0.015,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * 0.23,
                    child: DefaultTextField(
                      focusNode: cityFocus,
                      onFieldSubmitted: cityFieldSubmitted,
                      hintText: "Enter City",
                      labelText: "City",
                      isPassword: false,
                      textEditingController: cityController,
                      validator: cityValidator,
                      maxLength: 25,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.012,
                  ),
                  // property type / Price / currency
                  SizedBox(
                    width: width * 0.23,
                    child: DefaultTextField(
                      hintText: "Enter Area",
                      labelText: "Area",
                      isPassword: false,
                      textEditingController: areaController,
                      validator: areaValidator,
                      maxLength: 50,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.012,
                  ),
                  // property type / Price / currency
                  SizedBox(
                    width: width * 0.11,
                    child: DefaultTextField(
                      hintText: "Starting Price",
                      labelText: "Starting Price",
                      isPassword: false,
                      textEditingController: startingPriceController,
                      validator: startingPriceValidator,
                      maxLength: 25,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.01,
                  ),
                  SizedBox(
                    width: width * 0.1,
                    child: DefaultTextField(
                      hintText: "Ending Price",
                      labelText: "Ending Price",
                      isPassword: false,
                      textEditingController: endingPriceController,
                      validator: endingPriceValidator,
                      maxLength: 25,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),
              // text editor
              //TODO: text editor must not be empty validation please
              Container(
                width: width * .79,
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
                  controller: htmlEditorController, //required
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
                height: height * 0.02,
              ),

              // Gallery Heading and button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Gallery",
                    style: TextStyle(
                        color: controller.isDarkMode.value
                            ? kWhiteColor
                            : kDarkColor),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              // gallery preview
              Row(
                children: [
                  SizedBox(
                    width: width * .1,
                    height: height * .14,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 8.0,
                      ),
                      child: InkWell(
                        onTap: uploadImages,
                        child: Container(
                          alignment: Alignment.center,
                          color: controller.isDarkMode.value
                              ? kDarkCardColor
                              : kCardColor,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add_a_photo),
                          ),
                        ),
                      ),
                    ),
                  ),
                  images
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              DefaultTextField(
                focusNode: walkThroughFocus,
                onFieldSubmitted: walkThroughFieldSubmitted,
                hintText: "Enter Walk Through Video Url",
                labelText: "Walk Through Video",
                isPassword: false,
                textEditingController: walkThroughController,
                validator: walkThroughValidator,
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 100,
                    width: width * .19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Project Type",
                          style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkColor),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: controller.isDarkMode == true
                                ? kDarkCardColor
                                : kCardColor,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(15),
                              hint: const Text("Select Project Type"),
                              isExpanded: true,
                              value: categoryDropDownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: categoryOnChange,
                              items: categoryDropDownList,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    width: width * .19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Project Developer",
                          style: TextStyle(
                              color: controller.isDarkMode.value
                                  ? kWhiteColor
                                  : kDarkColor),
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: controller.isDarkMode == true
                                ? kDarkCardColor
                                : kCardColor,
                          ),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DropdownButton(
                              borderRadius: BorderRadius.circular(15),
                              hint: const Text("Select Project's Developer"),
                              isExpanded: true,
                              value: developerDropDownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: developerOnChange,
                              items: developerDropDownList,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * .02,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      selectedProjectNearByPlaces!,
                      Text(
                        'Select Amenities',
                        style: TextStyle(
                            color: controller.isDarkMode.value
                                ? kWhiteColor
                                : kDarkColor),
                      ),
                      Container(
                        color: controller.isDarkMode.value
                            ? kWhiteColor
                            : kDarkColor,
                        height: 290,
                        width: width * .19,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: projectNearByPlaces,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //amenities and other fields
              SizedBox(
                height: height * 0.015,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                child: Transform.scale(
                  scale: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(
                                color: controller.isDarkMode.value
                                    ? kWhiteColor
                                    : kDarkColor),
                          ),
                          SizedBox(
                            width: width * .01,
                          ),
                          CupertinoSwitch(
                            activeColor: kPrimaryColor,
                            value: statusValue,
                            onChanged: statusChanges,
                            trackColor: controller.isDarkMode.value
                                ? kWhiteColor
                                : kDarkCardColor,
                          ),
                        ],
                      ),
                      DefaultButton(
                        primaryColor: kPrimaryColor,
                        hoverColor: kDarkColor,
                        buttonText: buttonText,
                        width: width * .2,
                        height: height * .05,
                        onPressed: formSubmit,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: InkWell(
                  onTap: onTap,
                  child: Text(
                    cancelText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownItem(Country country) => Container(
        child: Row(
          children: <Widget>[
            CountryPickerUtils.getDefaultFlagImage(country),
            const SizedBox(
              width: 8.0,
            ),
            Text("+${country.phoneCode}(${country.isoCode})"),
          ],
        ),
      );
}
