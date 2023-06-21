// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class ProjectNearByPlacesForm extends GetView<ThemeChangeController> {
  ProjectNearByPlacesForm(
      {required this.projectPlaceTitleController,
      required this.statusChanges,
      // required this.iconImageUrl,
      // required this.onIconPress,
      required this.formSubmit,
      required this.statusValue,
      required this.buttonText,
      // required this.iconButtonText,
      required this.cancelText,
      required this.onTap,
      required this.iconPicker,
      super.key});

  double width = Get.width;
  double height = Get.height;

  // dynamic onIconPress;
  dynamic onChange;
  dynamic statusChanges;
  dynamic formSubmit;
  dynamic onTap;

  // String iconButtonText;
  String buttonText;
  // String iconImageUrl;
  String cancelText;
  bool statusValue;
  Widget iconPicker;

  TextEditingController projectPlaceTitleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Project Near By Places",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        DefaultTextField(
          hintText: "Project Near By Title",
          labelText: "Project Near By Title",
          isPassword: false,
          textEditingController: projectPlaceTitleController,
        ),
        SizedBox(
          height: height * 0.04,
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
          height: height * .04,
        ),
        iconPicker,
        SizedBox(
          height: height * .04,
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
