import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/TextFields.dart';
import 'package:get/get.dart';

class CategoryPageDesktop extends GetView<ThemeChangeController> {
  CategoryPageDesktop({super.key});

  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryDescriptionController = TextEditingController();
  TextEditingController categorySlugController = TextEditingController();
  TextEditingController categoryParentController = TextEditingController();
  TextEditingController categoryPublishController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: height * .8,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: width * .7,
                        child: const Text("Create Category")),
                    SizedBox(
                        width: width * .15,
                        child: DefaultButton(
                          primaryColor: kPrimaryColor,
                          hoverColor: kDarkColor,
                          buttonText: "Category List",
                          onPressed: () {},
                          width: width < 768 ? width / 9 : width / 5,
                          height: height * .05,
                        )),
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),
                Column(
                  children: [
                    DefaultTextField(
                      hintText: "Category Name",
                      labelText: "Category Name",
                      isPassword: false,
                      textEditingController: categoryNameController,
                    ),
                    DefaultTextField(
                      hintText: "Category Slug",
                      labelText: "Category Slug",
                      isPassword: false,
                      textEditingController: categoryNameController,
                    ),
                    DefaultTextField(
                      hintText: "Category Description",
                      labelText: "Category Description",
                      isPassword: false,
                      isMultiLine: true,
                      textEditingController: categoryNameController,
                    ),
                    DefaultTextField(
                      hintText: "Status ",
                      labelText: "Status",
                      isPassword: false,
                      textEditingController: categoryNameController,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
