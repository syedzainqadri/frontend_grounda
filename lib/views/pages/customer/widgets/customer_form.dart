// ignore_for_file: must_be_immutable

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/customerController/customer_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

import '../../../../widgets/maps.dart';

class CustomerForm extends GetView<ThemeChangeController> {
  CustomerForm(
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
  // controllers
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

  CustomerController customerController = Get.find<CustomerController>();

  QuillEditorController contentController;
  Widget images;
  Widget amenities;
  Widget? selectedAmenities;
  FocusNode titleFocus;
  FocusNode cityFocus;

  @override
  Widget build(BuildContext context) {
    var agencyController;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height * 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   "Add Customer",
              //   style: Theme.of(context).textTheme.bodyLarge,
              //   textAlign: TextAlign.start,
              // ),
              // SizedBox(
              //   height: height * 0.015,
              // ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.25,
                    child: Column(
                      children: [
                        // First Name
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "First Name",
                          labelText: "First Name",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Last Name
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Last name",
                          labelText: "Last name",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Phone
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Phone",
                          labelText: "Phone",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Phone 2
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Phone 2",
                          labelText: "Phone 2",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Whatsapp Number
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Whatsapp Number",
                          labelText: "Whatsapp Number",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Whatsapp Number
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Date of Birth",
                          labelText: "Date of Birth",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Container(
                          width: width * .25,
                          height: height * .03,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: const Text("Customer Login Credentials"),
                        ),
                        SizedBox(
                          width: width * 0.012,
                          height: height * .02,
                        ),
                        // Login Credentials
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "E-mail",
                          labelText: "E-mail",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          width: width * 0.012,
                        ),
                        // Password - Login Credentials
                        DefaultTextField(
                          focusNode: cityFocus,
                          onFieldSubmitted: cityFieldSubmitted,
                          hintText: "Password",
                          labelText: "Password",
                          isPassword: false,
                          textEditingController: cityController,
                          validator: cityValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          width: width * 0.012,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .002,
                  ),
                  SizedBox(
                    width: width * .002,
                    height: height * .15,
                  ),
                  // address
                  SizedBox(
                    width: width * .5,
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * .47,
                          child: const Text("Customer Address and Location"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 25.0),
                          child: Divider(
                            height: 1.0,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            // address column
                            SizedBox(
                              width: width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .002,
                                    height: height * .050,
                                  ),
                                  // Country
                                  SizedBox(
                                    height: 100,
                                    width: width * .22,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Country",
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller.isDarkMode == true
                                                ? kDarkCardColor
                                                : kCardColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              hint:
                                                  const Text("Select Country"),
                                              isExpanded: true,
                                              value: categoryDropDownValue,
                                              icon: const Icon(
                                                  Icons.arrow_downward),
                                              elevation: 16,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
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
                                  // State
                                  SizedBox(
                                    height: 100,
                                    width: width * .22,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "State",
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller.isDarkMode == true
                                                ? kDarkCardColor
                                                : kCardColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              hint: const Text("Select State"),
                                              isExpanded: true,
                                              value: categoryDropDownValue,
                                              icon: const Icon(
                                                  Icons.arrow_downward),
                                              elevation: 16,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
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
                                  // City
                                  SizedBox(
                                    height: 100,
                                    width: width * .22,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "City",
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
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: controller.isDarkMode == true
                                                ? kDarkCardColor
                                                : kCardColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              hint: const Text("Select City"),
                                              isExpanded: true,
                                              value: categoryDropDownValue,
                                              icon: const Icon(
                                                  Icons.arrow_downward),
                                              elevation: 16,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium,
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
                                  // Postal Code
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: cityFocus,
                                      onFieldSubmitted: cityFieldSubmitted,
                                      hintText: "Postal Code",
                                      labelText: "Postal Code",
                                      isPassword: false,
                                      textEditingController: cityController,
                                      validator: cityValidator,
                                      maxLength: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.012,
                                  ),
                                  // Address Line 1
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: cityFocus,
                                      onFieldSubmitted: cityFieldSubmitted,
                                      hintText: "Address Line 1",
                                      labelText: "Address Line 1",
                                      isPassword: false,
                                      textEditingController: cityController,
                                      validator: cityValidator,
                                      maxLength: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.012,
                                  ),
                                  // Address Line 1
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: cityFocus,
                                      onFieldSubmitted: cityFieldSubmitted,
                                      hintText: "Address Line 2",
                                      labelText: "Address Line 2",
                                      isPassword: false,
                                      textEditingController: cityController,
                                      validator: cityValidator,
                                      maxLength: 25,
                                    ),
                                  ),
                                ],
                              ),
                              // TODO; add map
                            ),
                            SizedBox(
                              width: width * 0.007,
                            ),
                            SizedBox(
                              width: width * 0.20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .008,
                                    height: height * .05,
                                  ),
                                  // MAP

                                  Container(
                                      width: width * .22,
                                      height: height * .57,
                                      decoration: BoxDecoration(
                                        color: kDarkCardColor,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: customerController
                                                  .latitude.value ==
                                              0
                                          ? const Center(
                                              child: CircularProgressIndicator(
                                              color: kPrimaryColor,
                                            ))
                                          : GoogleMap(
                                              lang: customerController
                                                  .longitude.value,
                                              lat: customerController
                                                  .latitude.value,
                                            )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
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
