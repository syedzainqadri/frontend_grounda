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

  @override
  Widget build(BuildContext context) {
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
              DefaultTextField(
                hintText: "Post Slug",
                labelText: "Post Slug",
                isPassword: false,
                textEditingController: postShortDescriptionController,
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
              Row(
                children: [
                  SizedBox(
                    width: width * 0.25,
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
                  SizedBox(
                    width: width * 0.25,
                    child: DefaultTextField(
                      hintText: "Enter Area",
                      labelText: "Area",
                      isPassword: false,
                      textEditingController: postTitleController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.012,
                  ),
                  SizedBox(
                    width: width * 0.2,
                    child: DefaultTextField(
                      hintText: "Enter Price Title",
                      labelText: "Price",
                      isPassword: false,
                      textEditingController: postTitleController,
                      prefixIcon: const Icon(Icons.currency_rupee_rounded),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                hintText: "Add video url here",
                labelText: "Video",
                isPassword: false,
                textEditingController: videoUrlController,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Expanded(
                child: TextEditor(controller: contentController),
              ),
              SizedBox(
                height: height * 0.015,
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
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                children: [
                  DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkColor,
                    buttonText: pictureButtonText,
                    width: width * .2,
                    height: height * .05,
                    onPressed: uploadImages,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkColor,
                    buttonText: pictureButtonText,
                    width: width * .2,
                    height: height * .05,
                    onPressed: uploadImages,
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.015,
              ),

              // Plot Number / Has Installment / ready to Possession

              Row(
                children: [
                  SizedBox(
                    width: width * 0.22,
                    child: DefaultTextField(
                      hintText: "Plot Number",
                      labelText: "Plot Number",
                      isPassword: false,
                      textEditingController: plotNumberController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.22,
                    child: Column(
                      children: [
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
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * 0.22,
                    child: Column(
                      children: [
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
                    width: width * .24,
                    child: DefaultTextField(
                      hintText: "Purpose",
                      labelText: "Purpose",
                      isPassword: false,
                      textEditingController: purposeController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * .24,
                    child: DefaultTextField(
                      hintText: "Property Type",
                      labelText: "Property Type",
                      isPassword: false,
                      textEditingController: propertyTypeController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * .24,
                    child: DefaultTextField(
                      hintText: "Property Sub-Type",
                      labelText: "Property Sub-Type",
                      isPassword: false,
                      textEditingController: propertySubTypeController,
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
                    width: width * .18,
                    child: DefaultTextField(
                      hintText: "Enter Number of Bedrooms",
                      labelText: "Number of Bedrooms",
                      isPassword: false,
                      textEditingController: bedRoomController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * .18,
                    child: DefaultTextField(
                      hintText: "Enter Number of Bedrooms",
                      labelText: "Number of Bedrooms",
                      isPassword: false,
                      textEditingController: bedRoomController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * .175,
                    child: DefaultTextField(
                      hintText: "Property Type ",
                      labelText: "Property Type",
                      isPassword: false,
                      textEditingController: bedRoomController,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.015,
                  ),
                  SizedBox(
                    width: width * .17,
                    child: DefaultTextField(
                      hintText: "Property Unit ",
                      labelText: "Property Unit",
                      isPassword: false,
                      textEditingController: bedRoomController,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.05,
              ),

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
}
