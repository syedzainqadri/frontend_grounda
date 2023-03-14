import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';

class CategoryForm extends GetView<ThemeChangeController> {
  CategoryForm({super.key});

  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryDescriptionController = TextEditingController();
  TextEditingController categorySlugController = TextEditingController();
  TextEditingController categoryParentController = TextEditingController();
  TextEditingController categoryStatusController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Create Category",
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        DefaultTextField(
          hintText: "Category Name",
          labelText: "Category Name",
          isPassword: false,
          textEditingController: categoryNameController,
        ),
        SizedBox(
          height: height * .02,
        ),
        DefaultTextField(
          hintText: "Category Slug",
          labelText: "Category Slug",
          isPassword: false,
          textEditingController: categoryNameController,
        ),
        SizedBox(
          height: height * .02,
        ),
        // TODO; Add rich text editor
        // DefaultTextField(
        //   hintText: "Category Description",
        //   labelText: "Category Description",
        //   isPassword: false,
        //   isMultiLine: true,
        //   textEditingController: categoryNameController,
        // ),

        //TODO; Create meta title field
        // DefaultTextField(
        //   hintText: "Meta Title",
        //   labelText: "Meta Title",
        //   isPassword: false,
        //   textEditingController: categoryNameController,
        // ),
        //TODO; Create meta descriptioin field
        // DefaultTextField(
        //   hintText: "Meta Description",
        //   labelText: "Meta Description",
        //   isPassword: false,
        //   textEditingController: categoryNameController,
        // ),
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
                    value: controller.isDarkMode.value,
                    onChanged: (val) {
                      controller.isDarkMode.value = val;
                    }),
              ],
            ),
          ),
        ),
        SizedBox(
          height: height * .05,
        ),
        DefaultButton(
          primaryColor: kPrimaryColor,
          hoverColor: kDarkColor,
          buttonText: "Submit",
          width: width * .2,
          height: height * .05,
          onPressed: () async {},
        ),
      ],
    );
  }
}
