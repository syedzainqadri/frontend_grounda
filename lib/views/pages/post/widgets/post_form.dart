// ignore_for_file: must_be_immutable

import 'package:country_currency_pickers/country.dart';
import 'package:country_currency_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/google_map_picker.dart';
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
      required this.dropDownList,
      required this.dropDownValue,
      required this.onChange,
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
      super.key});
  double width = Get.width;
  double height = Get.height;
  String dropDownValue;
  dynamic onChange;
  dynamic statusChanges;
  dynamic posessionChanges;
  dynamic installmentStatusChanges;
  dynamic formSubmit;
  bool posessionValue;
  bool statusValue;
  bool hasInstallmentValue;
  dynamic uploadImages;
  dynamic onTap;
  String buttonText;
  String pictureButtonText;
  String cancelText;
  List imageListUrl;
  List<DropdownMenuItem<String>> dropDownList;
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

  MapPickerController mapPickerController;
  TextEditingController mapTextController;

  @override
  Widget build(BuildContext context) {
    var buildDialogItem = [];
    bool filtered = false;
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SizedBox(
          height: hasInstallmentValue ? height * 1.8 : height * 1.5,
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

              Text(
                "Select Post Category",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: kPrimaryColor),
                textAlign: TextAlign.start,
              ),
              // category / currency / plot number
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * 0.20,
                    child: DropdownButton(
                      borderRadius: BorderRadius.circular(15),
                      hint: const Text("Select Post Category"),
                      isExpanded: true,
                      value: dropDownValue,
                      icon: const Icon(Icons.arrow_downward),
                      elevation: 16,
                      style: Theme.of(context).textTheme.bodyMedium,
                      underline: Container(
                        height: 2,
                        color: kDarkColor,
                      ),
                      onChanged: onChange,
                      items: dropDownList,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.012,
                  ),
                  // property type / Price / currency
                  SizedBox(
                    width: width * 0.135,
                    child: DefaultTextField(
                      hintText: "Enter Price",
                      labelText: "Price",
                      isPassword: false,
                      textEditingController: postTitleController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * 0.13,
                    child: CountryPickerDropdown(
                      initialValue: 'PK',
                      itemBuilder: _buildDropdownItem,
                      itemFilter: filtered
                          ? (c) => ['PK', 'DE', 'GB', 'CN'].contains(c.isoCode)
                          : null,
                      onValuePicked: (Country? country) {
                        print("${country?.name}");
                      },
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * 0.22,
                    child: DefaultTextField(
                      hintText: "Plot Number",
                      labelText: "Plot Number",
                      isPassword: false,
                      textEditingController: plotNumberController,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),
              // text editor
              Expanded(
                child: TextEditor(controller: contentController),
              ),

              SizedBox(
                height: height * 0.04,
              ),

              // Video URL
              DefaultTextField(
                hintText: "Add video url here",
                labelText: "Video URL",
                isPassword: false,
                textEditingController: videoUrlController,
              ),

              SizedBox(
                height: height * 0.015,
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

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * .25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Select Purpose",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.start,
                        ),
                        DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          hint: const Text("Purpose"),
                          isExpanded: true,
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: Theme.of(context).textTheme.bodyMedium,
                          underline: Container(
                            height: 2,
                            color: kDarkColor,
                          ),
                          onChanged: onChange,
                          items: dropDownList,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          "Select Property Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.start,
                        ),
                        DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          hint: const Text("Property Type"),
                          isExpanded: true,
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: Theme.of(context).textTheme.bodyMedium,
                          underline: Container(
                            height: 2,
                            color: kDarkColor,
                          ),
                          onChanged: onChange,
                          items: dropDownList,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        Text(
                          "Select Property Sub-Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.start,
                        ),
                        DropdownButton(
                          borderRadius: BorderRadius.circular(15),
                          hint: const Text("Property Sub-Type"),
                          isExpanded: true,
                          value: dropDownValue,
                          icon: const Icon(Icons.arrow_downward),
                          elevation: 16,
                          style: Theme.of(context).textTheme.bodyMedium,
                          underline: Container(
                            height: 2,
                            color: kDarkColor,
                          ),
                          onChanged: onChange,
                          items: dropDownList,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: width * .02,
                  ),

                  // bedrooms / bathrooms
                  SizedBox(
                    width: width * .25,
                    child: Column(
                      children: [
                        DefaultTextField(
                          hintText: "Enter Number of Bedrooms",
                          labelText: "Number of Bedrooms",
                          isPassword: false,
                          textEditingController: bedRoomController,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        DefaultTextField(
                          hintText: "Enter Number of Bedrooms",
                          labelText: "Number of Bedrooms",
                          isPassword: false,
                          textEditingController: bedRoomController,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        DefaultTextField(
                          hintText: "Property Area ",
                          labelText: "Property Area",
                          isPassword: false,
                          textEditingController: bedRoomController,
                        ),
                        SizedBox(
                          height: height * 0.025,
                        ),
                        DefaultTextField(
                          hintText: "Property Unit ",
                          labelText: "Property Unit",
                          isPassword: false,
                          textEditingController: bedRoomController,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: width * .02,
                  ),

                  SizedBox(
                    width: width * .2,
                    child: Column(
                      children: [
                        // Has Installments
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
                                height: height * 0.015,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? DefaultTextField(
                                hintText: "Enter Advance Ammount",
                                labelText: "Advance Ammount",
                                isPassword: false,
                                textEditingController: advanceController,
                              )
                            : const Offstage(),
                        hasInstallmentValue
                            ? SizedBox(
                                height: height * 0.015,
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
                                height: height * 0.015,
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
                        // Has Installments end

                        // Ready for Possession
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
                                height: height * 0.015,
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
                                height: height * 0.015,
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
                        // Ready for Possession end
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.04,
              ),

              // Plot Number / Has Installment / ready to Possession

              // Location / Amenities / contact Details
              Row(
                children: [
                  SizedBox(
                    width: width * .23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Location"),
                        SizedBox(
                          height: height * 0.15,
                        ),
                        Container(
                          width: width * .22,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("List of Location"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  // Amenities
                  SizedBox(
                    width: width * .23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text("Amenities"),
                        SizedBox(
                          height: height * 0.15,
                        ),
                        Container(
                          width: width * .22,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("List of Amenities"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  // Contact Details
                  SizedBox(
                    width: width * .25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contact Person Details",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        DefaultTextField(
                          hintText: "Contact Person's Name",
                          labelText: "Contact Person's Name",
                          isPassword: false,
                          textEditingController: contactPersonNameController,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        DefaultTextField(
                          hintText: "Contact Person's Email",
                          labelText: "Contact Person's Email",
                          isPassword: false,
                          textEditingController: contactPersonEmailController,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        DefaultTextField(
                          hintText: "Contact Person's Mobile",
                          labelText: "Contact Person's Mobile",
                          isPassword: false,
                          textEditingController: contactPersonsMobileController,
                        ),
                        SizedBox(
                          height: height * 0.015,
                        ),
                        DefaultTextField(
                          hintText: "Contact Person's Landline",
                          labelText: "Contact Person's Landline",
                          isPassword: false,
                          textEditingController:
                              contactPersonsLandlineController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),

              Row(
                children: [
                  SizedBox(
                    width: width * .3,
                    child: Column(
                      children: [
                        DefaultTextField(
                          hintText: "Address",
                          labelText: "Enter Address of Property",
                          isPassword: false,
                          textEditingController: bedRoomController,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .3,
                    height: height * .4,
                    child: Column(
                      children: [
                        GoogleMapPicker(
                          mapPickerController: mapPickerController,
                          textController: mapTextController,
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                child: Transform.scale(
                  scale: 1,
                  child: Row(
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
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultButton(
                primaryColor: kPrimaryColor,
                hoverColor: kDarkColor,
                buttonText: buttonText,
                width: width * .2,
                height: height * .05,
                onPressed: formSubmit,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  cancelText,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: kPrimaryColor),
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
