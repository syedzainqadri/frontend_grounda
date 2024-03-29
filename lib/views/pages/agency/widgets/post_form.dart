// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_ediotor.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PostForm extends GetView<ThemeChangeController> {
  PostForm(
      {required this.postTitleController,
      required this.categoryDropDownList,
      required this.categoryDropDownValue,
      required this.categoryOnChange,
      required this.subCategoryDropDownList,
      required this.subCategoryDropDownValue,
      required this.subCategoryOnChange,
      required this.statusChanges,
      required this.formSubmit,
      required this.statusValue,
      required this.uploadImages,
      required this.buttonText,
      required this.pictureButtonText,
      required this.cancelText,
      required this.onTap,
      required this.videoUrlController,
      required this.cityController,
      required this.areaController,
      required this.plotNumberController,
      required this.priceController,
      required this.hasInstallmentValue,
      required this.installmentStatusChanges,
      required this.posessionChanges,
      required this.posessionValue,
      required this.bathRoomController,
      required this.bedRoomController,
      required this.advanceController,
      required this.noOfInstallmentController,
      required this.monthlyInstallmentValueController,
      required this.showContactDetails,
      required this.images,
      required this.amenities,
      required this.totalAreaController,
      required this.propertyAreaUnitList,
      required this.propertyAreaUnitOnChange,
      required this.propertyAreaUnitValue,
      required this.purposeList,
      required this.purposeOnChange,
      required this.purposeValue,
      required this.postTitleValidator,
      required this.cityValidator,
      required this.areaValidator,
      required this.priceValidator,
      required this.advanceValidator,
      required this.bathroomValidator,
      required this.bedroomValidator,
      required this.monthlyInstallmentValidator,
      required this.noOfInstallmentValidator,
      required this.propertyAreaValidator,
      required this.plotNumberValidator,
      required this.contentController,
      required this.showContactDetailsChanges,
      required this.titleFieldSubmitted,
      required this.titleFocus,
      required this.cityFocus,
      required this.cityFieldSubmitted,
      this.selectedAmenities,
      super.key});
  double width = Get.width;
  double height = Get.height;
  String categoryDropDownValue;
  String subCategoryDropDownValue;
  dynamic categoryOnChange;
  dynamic subCategoryOnChange;
  dynamic statusChanges;
  dynamic posessionChanges;
  dynamic showContactDetailsChanges;
  dynamic installmentStatusChanges;
  dynamic formSubmit;
  dynamic uploadImages;
  dynamic onTap;
  dynamic postTitleValidator;
  dynamic cityValidator;
  dynamic areaValidator;
  dynamic propertyAreaValidator;
  dynamic plotNumberValidator;
  dynamic bathroomValidator;
  dynamic bedroomValidator;
  dynamic noOfInstallmentValidator;
  dynamic monthlyInstallmentValidator;
  dynamic advanceValidator;
  bool posessionValue;
  bool showContactDetails;
  bool statusValue;
  bool hasInstallmentValue;
  String buttonText;
  String pictureButtonText;
  String cancelText;
  String purposeValue;
  dynamic purposeOnChange;
  dynamic propertyAreaUnitOnChange;
  dynamic priceValidator;
  dynamic titleFieldSubmitted;
  dynamic cityFieldSubmitted;
  String propertyAreaUnitValue;
  List<DropdownMenuItem<String>> propertyAreaUnitList;
  List<DropdownMenuItem<String>> categoryDropDownList;
  List<DropdownMenuItem<String>> subCategoryDropDownList;
  List<DropdownMenuItem<String>> purposeList;
  TextEditingController postTitleController;
  TextEditingController totalAreaController;
  TextEditingController videoUrlController;
  TextEditingController cityController;
  TextEditingController areaController;
  TextEditingController plotNumberController;
  TextEditingController priceController;
  TextEditingController bathRoomController;
  TextEditingController bedRoomController;
  TextEditingController advanceController;
  TextEditingController noOfInstallmentController;
  TextEditingController monthlyInstallmentValueController;
  QuillEditorController contentController;
  Widget images;
  Widget amenities;
  Widget? selectedAmenities;
  FocusNode titleFocus;
  FocusNode cityFocus;

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
                "Create Post",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                autofocus: true,
                focusNode: titleFocus,
                onFieldSubmitted: titleFieldSubmitted,
                hintText: "Enter Post Title",
                labelText: "Post Title",
                isPassword: false,
                textEditingController: postTitleController,
                validator: postTitleValidator,
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
                    width: width * 0.23,
                    child: DefaultTextField(
                      hintText: "Enter Price",
                      labelText: "Price",
                      isPassword: false,
                      textEditingController: priceController,
                      validator: priceValidator,
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
              SizedBox(
                height: 250,
                child: TextEditor(textController: contentController),
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
                    style: Theme.of(context).textTheme.bodyMedium,
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
                          color: controller.isDarkMode == true
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
                  //TODO:place it to create_post_page//
                  images
                ],
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
                          "Select Purpose",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
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
                                hint: const Text("Purpose"),
                                isExpanded: true,
                                value: purposeValue,
                                icon: const Icon(Icons.arrow_downward),
                                elevation: 16,
                                style: Theme.of(context).textTheme.bodyMedium,
                                underline: Container(
                                  height: 2,
                                  color: Colors.transparent,
                                ),
                                onChanged: purposeOnChange,
                                items: purposeList),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  SizedBox(
                    height: 100,
                    width: width * .19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Post Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
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
                              hint: const Text("Select Post Type"),
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  SizedBox(
                    height: 100,
                    width: width * .19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select Post Sub-Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
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
                              hint: const Text("Select Post Sub-Type"),
                              isExpanded: true,
                              value: subCategoryDropDownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: subCategoryOnChange,
                              items: subCategoryDropDownList,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              //amenities and other fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 500,
                    width: width * .19,
                    child: Column(
                      children: [
                        DefaultTextField(
                          prefixIcon: const Icon(Icons.aspect_ratio),
                          hintText: "Property Area",
                          labelText: "Enter Total Area",
                          isPassword: false,
                          textEditingController: totalAreaController,
                          validator: propertyAreaValidator,
                          maxLength: 10,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        DefaultTextField(
                          hintText: "Add video url here",
                          labelText: "Video URL",
                          isPassword: false,
                          textEditingController: videoUrlController,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                          child: Transform.scale(
                            scale: .8,
                            child: Row(
                              children: [
                                Text(
                                  "Has Installments",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width: width * .01,
                                ),
                                CupertinoSwitch(
                                  activeColor: kPrimaryColor,
                                  value: hasInstallmentValue,
                                  onChanged: installmentStatusChanges,
                                ),
                              ],
                            ),
                          ),
                        ),
                        hasInstallmentValue
                            ? SizedBox(
                                height: height * .02,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? DefaultTextField(
                                hintText: "Enter Advance Amount",
                                labelText: "Advance Amount",
                                isPassword: false,
                                textEditingController: advanceController,
                                validator: advanceValidator,
                                maxLength: 10,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? SizedBox(
                                height: height * .02,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? DefaultTextField(
                                hintText: "Number of Installments",
                                labelText: "No of Installments",
                                isPassword: false,
                                textEditingController:
                                    noOfInstallmentController,
                                validator: noOfInstallmentValidator,
                                maxLength: 10,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? SizedBox(
                                height: height * .02,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? DefaultTextField(
                                hintText: "Monthly Installment Value",
                                labelText: "Monthly Installement Value",
                                isPassword: false,
                                textEditingController:
                                    monthlyInstallmentValueController,
                                validator: monthlyInstallmentValidator,
                                maxLength: 10,
                              )
                            : const Offstage(),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  SizedBox(
                    height: 500,
                    width: width * .19,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
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
                              hint: const Text("Property Area Unit"),
                              isExpanded: true,
                              value: propertyAreaUnitValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: propertyAreaUnitOnChange,
                              items: propertyAreaUnitList,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        DefaultTextField(
                          hintText: "Plot / Flat Number",
                          labelText: "Plot / Flat Number",
                          isPassword: false,
                          textEditingController: plotNumberController,
                          validator: plotNumberValidator,
                          maxLength: 10,
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        //possession
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                          child: Transform.scale(
                            scale: .8,
                            child: Row(
                              children: [
                                Text(
                                  "Ready for Possession",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width: width * .01,
                                ),
                                CupertinoSwitch(
                                  activeColor: kPrimaryColor,
                                  value: posessionValue,
                                  onChanged: posessionChanges,
                                ),
                              ],
                            ),
                          ),
                        ),
                        posessionValue
                            ? SizedBox(
                                height: height * 0.02,
                              )
                            : const Offstage(),
                        posessionValue
                            ? DefaultTextField(
                                hintText: "Enter Number of Bedrooms",
                                labelText: "Bedrooms",
                                isPassword: false,
                                textEditingController: bedRoomController,
                                validator: bedroomValidator,
                                maxLength: 2,
                              )
                            : const Offstage(),
                        posessionValue
                            ? SizedBox(
                                height: height * 0.02,
                              )
                            : const Offstage(),
                        posessionValue
                            ? DefaultTextField(
                                hintText: "Enter Number of Bath Rooms",
                                labelText: "Bathrooms",
                                isPassword: false,
                                textEditingController: bathRoomController,
                                validator: bathroomValidator,
                                maxLength: 2,
                              )
                            : const Offstage(),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0, left: 0.0),
                          child: Transform.scale(
                            scale: .8,
                            child: Row(
                              children: [
                                Text(
                                  "Show Contact Details",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                SizedBox(
                                  width: width * .01,
                                ),
                                CupertinoSwitch(
                                  activeColor: kPrimaryColor,
                                  value: showContactDetails,
                                  onChanged: showContactDetailsChanges,
                                ),
                              ],
                            ),
                          ),
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
                      selectedAmenities!,
                      Text(
                        'Select Amenities',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kPrimaryColor),
                      ),
                      Container(
                        color: Colors.white,
                        height: 290,
                        width: width * .19,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: amenities,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: height * 0.04,
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
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: width * .01,
                          ),
                          CupertinoSwitch(
                            activeColor: kPrimaryColor,
                            value: statusValue,
                            onChanged: statusChanges,
                          ),
                        ],
                      ),
                      DefaultButton(
                        primaryColor: kPrimaryColor,
                        hoverColor: kDarkCardColor,
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
}
