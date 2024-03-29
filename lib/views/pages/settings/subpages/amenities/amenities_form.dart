// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class AmenitiesForm extends GetView<ThemeChangeController> {
  AmenitiesForm(
      {required this.amenityTitleController,
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

  TextEditingController amenityTitleController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Amenity",
          style: TextStyle(
            color: controller.isDarkMode.value ? kDarkTextColor : kTextColor,
          ),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        DefaultTextField(
          hintText: "Amenity Title",
          labelText: "Amenity Title",
          isPassword: false,
          textEditingController: amenityTitleController,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        SizedBox(
          height: height * 0.04,
        ),

        // Row(
        //   children: [
        //     SvgPicture.network(iconImageUrl),
        //     DefaultButton(
        //       primaryColor: kPrimaryColor,
        //       hoverColor: kDarkCardColor,
        //       buttonText: iconButtonText,
        //       onPressed: onIconPress,
        //       width: width * .1,
        //       height: height * .05,
        //     ),
        //   ],
        // ),

        // DefaultTextField(
        //   hintText: "Amenity Icon",
        //   labelText: "Amenity Icon",
        //   isPassword: false,
        //   textEditingController: amenityIconController,
        // ),

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
                  "Status",
                  style: TextStyle(
                    color: controller.isDarkMode.value
                        ? kDarkTextColor
                        : kTextColor,
                  ),
                ),
                SizedBox(
                  width: width * .01,
                ),
                CupertinoSwitch(
                  activeColor: kPrimaryColor,
                  value: statusValue,
                  onChanged: statusChanges,
                  trackColor:
                      controller.isDarkMode.value ? kDarkTextColor : kTextColor,
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
