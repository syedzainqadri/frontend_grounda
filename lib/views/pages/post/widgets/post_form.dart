// ignore_for_file: must_be_immutable

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/open_street_map.dart';
import 'package:frontend_grounda/widgets/text_ediotor.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';
import 'package:map_picker/map_picker.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PostForm extends GetView<ThemeChangeController> {
  PostForm(
      {required this.postTitleController,
      required this.postShortDescriptionController,
      required this.contentController,
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
      required this.imageListUrl,
      required this.videoUrlController,
      required this.cityController,
      required this.areaController,
      required this.plotNumberController,
      required this.priceController,
      required this.hasInstallmentValue,
      required this.installmentStatusChanges,
      required this.posessionChanges,
      required this.posessionValue,
      required this.contactPersonsLandlineController,
      required this.contactPersonEmailController,
      required this.contactPersonNameController,
      required this.contactPersonsMobileController,
      required this.bathRoomController,
      required this.bedRoomController,
      required this.advanceController,
      required this.noOfInstallmentController,
      required this.monthlyInstallmentValueController,
      required this.purposeController,
      required this.propertyTypeController,
      required this.propertySubTypeController,
      required this.mapPickerController,
      required this.mapTextController,
      required this.amenitiesCount,
      required this.amenitiesBuilder,
      required this.showContactDetails,
      required this.showContactDetailsChanges,
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
  bool posessionValue;
  bool showContactDetails;
  bool statusValue;
  bool hasInstallmentValue;
  dynamic uploadImages;
  dynamic onTap;
  String buttonText;
  String pictureButtonText;
  String cancelText;
  List imageListUrl;
  List<DropdownMenuItem<String>> categoryDropDownList;
  List<DropdownMenuItem<String>> subCategoryDropDownList;
  TextEditingController postTitleController;
  TextEditingController postShortDescriptionController;
  TextEditingController videoUrlController;
  TextEditingController cityController;
  TextEditingController areaController;
  TextEditingController plotNumberController;
  TextEditingController priceController;
  TextEditingController contactPersonsLandlineController;
  TextEditingController contactPersonsMobileController;
  TextEditingController contactPersonEmailController;
  TextEditingController contactPersonNameController;
  TextEditingController bathRoomController;
  TextEditingController bedRoomController;
  TextEditingController advanceController;
  TextEditingController noOfInstallmentController;
  TextEditingController monthlyInstallmentValueController;
  TextEditingController purposeController;
  TextEditingController propertyTypeController;
  TextEditingController propertySubTypeController;
  QuillEditorController contentController;
  Widget? Function(BuildContext, int) amenitiesBuilder;
  int amenitiesCount;

  MapPickerController mapPickerController;
  TextEditingController mapTextController;

  List purposeList = ["For Sell", "For Rent"];
  List propertyAreaUnitList = ["Marla", "SQFT", "SQMT"];
  RxString purposeValue = 'For Sell'.obs;
  RxString propertyAreaUnitValue = 'SQFT'.obs;

  @override
  Widget build(BuildContext context) {
    var buildDialogItem = [];
    bool filtered = false;
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
                hintText: "Enter Post Title",
                labelText: "Post Title",
                isPassword: false,
                textEditingController: postTitleController,
              ),
              SizedBox(
                height: height * 0.015,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * 0.23,
                    child: DefaultTextField(
                      hintText: "Enter City",
                      labelText: "City",
                      isPassword: false,
                      textEditingController: cityController,
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
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),
              // text editor
              SizedBox(
                height: 250,
                child: Expanded(
                  child: TextEditor(controller: contentController),
                ),
              ),

              SizedBox(
                height: height * 0.04,
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
                  imageListUrl.isEmpty
                      ? Text(
                          'Please add Images',
                          style: Theme.of(context).textTheme.bodySmall,
                        )
                      : Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: imageListUrl.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: height * 1,
                                width: width * 1,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(imageListUrl[index]),
                              );
                            },
                          ),
                        ),
                ],
              ),

              SizedBox(
                height: height * 0.04,
              ),
              //TODO : adjust structure here
              //Category section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                              value: purposeValue.value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (value) {
                                purposeValue.value = value.toString();
                              },
                              items: purposeList
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
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
                          "Post Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.start,
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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          textEditingController: postTitleController,
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
                              value: propertyAreaUnitValue.value,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: (value) {
                                propertyAreaUnitValue.value = value.toString();
                              },
                              items: propertyAreaUnitList
                                  .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * .02,
                        ),
                        DefaultTextField(
                          hintText: "Plot Number",
                          labelText: "Plot Number",
                          isPassword: false,
                          textEditingController: plotNumberController,
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
                        //possession
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
                              )
                            : const Offstage(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, left: 0.0),
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
                    children: [
                      Container(
                        color: Colors.white,
                        height: 300,
                        width: width * .19,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            itemBuilder: amenitiesBuilder,
                            itemCount: amenitiesCount,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),

              SizedBox(
                height: height * 0.04,
              ),
              Center(
                child: SizedBox(
                  width: width * .4,
                  height: height * .4,
                  child: OpenStreetMap(
                    onPicked: (pickedData) {
                      print(pickedData.latLong.latitude);
                      print(pickedData.latLong.longitude);
                      print(pickedData.address);
                    },
                  ),
                ),
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
