import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/categoryController/category_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

class PaymentMethodPageMobile extends GetView<ThemeChangeController> {
  PaymentMethodPageMobile({super.key});
  final CategoryController categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Category'),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: height * .8,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: categoryController.category.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    color: controller.isDarkMode.value
                        ? kDarkCardColor
                        : kCardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                        borderRadius: BorderRadius.circular(30),
                                        child: categoryController
                                                    .category[index].image !=
                                                null
                                            ? Image.network(categoryController
                                                .category[index].image!)
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
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          categoryController
                                              .category[index].name!,
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
                                            categoryController.category[index]
                                                        .status ==
                                                    true
                                                ? Text(
                                                    "Active",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color:
                                                                Colors.green),
                                                  )
                                                : Text(
                                                    'UnPublished',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall!
                                                        .copyWith(
                                                            color: Colors.red),
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
                                    onPressed: () {},
                                    icon: SvgPicture.asset(
                                        "assets/icons/edit.svg"),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  IconButton(
                                    onPressed: () {},
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
          ),
        ],
      ),
    );
  }
}
