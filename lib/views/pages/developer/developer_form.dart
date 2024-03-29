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

class DeveloperForm extends GetView<ThemeChangeController> {
  DeveloperForm(
      {required this.developerNameController,
      required this.descriptionController,
      required this.statusChanges,
      required this.formSubmit,
      required this.statusValue,
      required this.uploadImages,
      required this.buttonText,
      required this.pictureButtonText,
      required this.cancelText,
      required this.onTap,
      required this.nameValidator,
      super.key});

  double width = Get.width;
  double height = Get.height;
  dynamic statusChanges;
  dynamic formSubmit;
  bool statusValue;
  dynamic uploadImages;
  dynamic onTap;
  String buttonText;
  String pictureButtonText;
  String cancelText;
  dynamic nameValidator;

  TextEditingController developerNameController;

  QuillEditorController descriptionController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Developer",
          style: TextStyle(
            color: controller.isDarkMode.value ? kWhiteColor : kDarkCardColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        DefaultTextField(
          maxLength: 20,
          hintText: "Developer Name",
          labelText: "Developer Name",
          isPassword: false,
          textEditingController: developerNameController,
          validator: nameValidator,
        ),
        TextEditor(textController: descriptionController),
        SizedBox(
          height: height * .02,
        ),
        Expanded(child: TextEditor(textController: descriptionController)),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 0.0),
          child: Transform.scale(
            scale: .8,
            child: Row(
              children: [
                Text(
                  "Status",
                  style: TextStyle(
                    color: controller.isDarkMode.value
                        ? kWhiteColor
                        : kDarkCardColor,
                  ),
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
          ),
        ),
        SizedBox(
          height: height * .02,
        ),
        DefaultButton(
          primaryColor: kPrimaryColor,
          hoverColor: kDarkCardColor,
          buttonText: pictureButtonText,
          width: width * .2,
          height: height * .05,
          onPressed: uploadImages,
        ),
        SizedBox(
          height: height * .02,
        ),
        DefaultButton(
          primaryColor: kPrimaryColor,
          hoverColor: kDarkCardColor,
          buttonText: buttonText,
          width: width * .2,
          height: height * .05,
          onPressed: formSubmit,
        ),
        SizedBox(
          height: height * .02,
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
    );
  }
}
