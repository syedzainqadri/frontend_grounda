import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/models/categoryModel/category_model.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/category/category_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CategoryPageDesktop extends GetView<ThemeChangeController> {
  CategoryPageDesktop({super.key});

  final TextEditingController searchCategory = TextEditingController();
  final CategoryController categoryController = Get.find<CategoryController>();
  QuillEditorController descriptionController = QuillEditorController();
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categorySlugController = TextEditingController();
  TextEditingController categoryStatusController = TextEditingController();
  List<CategoryModel> categoryModel = [];

  var selectedItemId = 0.obs;
  var isPublished = false.obs;
  var catId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Category'),
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .25,
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: controller.isDarkMode.value
                          ? kDarkShadowColor.withOpacity(.9)
                          : kShadowColor.withOpacity(.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: categoryController.category.value.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : CategoryForm(
                          categoryNameController: categoryNameController,
                          categorySlugController: categorySlugController,
                          categoryStatusController: categoryStatusController,
                          descriptionController: descriptionController,
                          dropDownList: categoryController.category
                              .map<DropdownMenuItem<String>>((value) {
                            return DropdownMenuItem<String>(
                              value: value.name,
                              child: Text(value.name!),
                            );
                          }).toList(),
                          dropDownValue:
                              categoryController.category.first.name!,
                          onChange: (selectedValue) {
                            categoryController.selectedItemName.value =
                                selectedValue;
                            for (int i = 0;
                                i < categoryController.category.length;
                                i++) {
                              if (categoryController.selectedItemName ==
                                  categoryController.category[i].name) {
                                selectedItemId.value =
                                    categoryController.category[i].id!;
                              }
                            }
                            print(categoryController.selectedItemName.value);
                            print(selectedItemId.value);
                          },
                          buttonText: catId.value == '' ? 'Submit' : 'Update',
                          formSubmit: () async {
                            if (catId.value == '') {
                              Get.defaultDialog(
                                title: 'Creating Category',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              print(selectedItemId);
                              var description =
                                  await descriptionController.getText();
                              print(description);
                              await categoryController.createNewCategory(
                                  categoryController.imageUrl.value,
                                  categoryNameController.text,
                                  categorySlugController.text,
                                  description,
                                  selectedItemId.value,
                                  isPublished.value);
                              await categoryController.getCategories();
                              Navigator.pop(context);
                            } else {
                              Get.defaultDialog(
                                title: 'Updating Category',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );
                              var description =
                                  await descriptionController.getText();
                              await categoryController.updateThisCategory(
                                  int.parse(catId.value),
                                  categoryController.imageUrl.value,
                                  categoryNameController.text,
                                  categorySlugController.text,
                                  description,
                                  selectedItemId.value,
                                  isPublished.value);
                              categoryNameController.text = '';
                              categorySlugController.text = '';
                              descriptionController.clear();
                              selectedItemId.value = 0;
                              catId.value = '';
                              await categoryController.getCategories();
                              Navigator.pop(context);
                            }
                          },
                          cancelText: catId.value == '' ? '' : 'Cancel Update',
                          onTap: () async {
                            categoryNameController.text = '';
                            categorySlugController.text = '';
                            descriptionController.clear();
                            selectedItemId.value = 0;
                            catId.value = '';
                            await categoryController.getCategories();
                          },
                          pictureButtonText:
                              categoryController.imageUrl.value.isEmpty
                                  ? 'Add Picture'
                                  : 'Update Picture',
                          uploadImages: () async {
                            Get.defaultDialog(
                              title: 'Uploading Image',
                              content: const Center(
                                child: CircularProgressIndicator(
                                    color: kPrimaryColor),
                              ),
                            );
                            await categoryController.getImage();
                            Navigator.pop(context);
                          },
                          statusValue: isPublished.value,
                          statusChanges: (value) {
                            isPublished.value = value;
                            print(isPublished);
                          },
                        ),
                ),
              ),
              SizedBox(
                width: width * .03,
              ),
              Container(
                height: height * .8,
                width: width * .5,
                decoration: BoxDecoration(
                  color: controller.isDarkMode.value
                      ? kDarkFrameColor
                      : kFrameColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: controller.isDarkMode.value
                          ? kDarkShadowColor.withOpacity(.9)
                          : kShadowColor.withOpacity(.5),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: width * .45,
                            child: DefaultTextField(
                              textEditingController: searchCategory,
                              hintText: "Search Category",
                              labelText: "Search",
                              isPassword: false,
                              suffixIcon:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      SizedBox(
                        height: height * .6,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: categoryController.category.value.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              color: controller.isDarkMode.value
                                  ? kDarkCardColor
                                  : kCardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * .06,
                                              child: CircleAvatar(
                                                backgroundColor: kWhiteColor,
                                                radius: 30,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: categoryController
                                                              .category[index]
                                                              .image !=
                                                          null
                                                      ? Image.network(
                                                          categoryController
                                                              .category[index]
                                                              .image!)
                                                      : SvgPicture.asset(
                                                          '/images/logo.svg',
                                                          fit: BoxFit.cover,
                                                          width: 30,
                                                          height: 30,
                                                        ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    categoryController.category
                                                        .value[index].name!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyLarge,
                                                  ),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "Status: ",
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall,
                                                      ),
                                                      categoryController
                                                                  .category[
                                                                      index]
                                                                  .published ==
                                                              true
                                                          ? Text(
                                                              "Active",
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .green),
                                                            )
                                                          : Text(
                                                              'UnPublished',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodySmall!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .red),
                                                            ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () async {
                                                descriptionController.clear();
                                                categoryNameController.text =
                                                    categoryController
                                                        .category[index].name!;
                                                categorySlugController.text =
                                                    categoryController
                                                        .category[index].slug!;
                                                descriptionController
                                                    .insertText(
                                                        categoryController
                                                            .category[index]
                                                            .description!);
                                                isPublished.value =
                                                    categoryController
                                                        .category[index]
                                                        .published!;
                                                selectedItemId.value =
                                                    categoryController
                                                        .category[index]
                                                        .parentId!;
                                                catId.value = categoryController
                                                    .category[index].id
                                                    .toString();
                                                categoryController
                                                        .imageUrl.value =
                                                    categoryController
                                                        .category[index].image!;
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/edit.svg"),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                Get.defaultDialog(
                                                  title: 'Deleting Category',
                                                  content: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                            color:
                                                                kPrimaryColor),
                                                  ),
                                                );
                                                await categoryController
                                                    .deleteThisCategory(
                                                        categoryController
                                                            .category[index]
                                                            .id!);
                                                await categoryController
                                                    .getCategories();
                                                Navigator.pop(context);
                                              },
                                              icon: SvgPicture.asset(
                                                  "assets/icons/trash.svg"),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//TODO: Drop Down is not showing current value