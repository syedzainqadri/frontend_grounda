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
  QuillEditorController contentController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 1700,
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
            Text(
              "Select Post Category",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: kPrimaryColor),
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DropdownButton(
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
              hintText: "Category Short Description",
              labelText: "Category Slug",
              isPassword: false,
              textEditingController: postShortDescriptionController,
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
            Expanded(
              child: TextEditor(controller: contentController),
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter City",
              labelText: "City",
              isPassword: false,
              textEditingController: cityController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Area",
              labelText: "Area",
              isPassword: false,
              textEditingController: areaController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Plot Number",
              labelText: "Plot Number",
              isPassword: false,
              textEditingController: plotNumberController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Price",
              labelText: "price",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
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
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Advance Ammount",
              labelText: "Advance Ammount",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Number of Installments",
              labelText: "No of Installments",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Monthly Installment Value",
              labelText: "Monthly Installement Value",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
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
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Number of Bedrooms",
              labelText: "Bedrooms",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Number of Bath Rooms",
              labelText: "Bathrooms",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Contact Person's Name",
              labelText: "Contact Person's Name",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Contact Person's Email",
              labelText: "Contact Person's Email",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Contact Person's Mobile",
              labelText: "Contact Person's Mobile",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Contact Person's Landline",
              labelText: "Contact Person's Landline",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            DefaultTextField(
              hintText: "Enter Number of Bath Rooms",
              labelText: "Bathrooms",
              isPassword: false,
              textEditingController: priceController,
            ),
            SizedBox(
              height: height * 0.015,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 0.0),
              child: Transform.scale(
                scale: .8,
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
              buttonText: pictureButtonText,
              width: width * .2,
              height: height * .05,
              onPressed: uploadImages,
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
    );
  }
}
