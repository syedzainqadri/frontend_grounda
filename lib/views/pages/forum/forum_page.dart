import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

class ForumPage extends GetView<ThemeChangeController> {
  ForumPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: DashBoardAppBar(title: 'Forums'),
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .8,
                decoration: BoxDecoration(
                  color:
                      controller.isDarkMode.value ? kDarkCardColor : kCardColor,
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
                              textEditingController: searchController,
                              hintText: "Search Order",
                              labelText: "Search",
                              isPassword: false,
                              suffixIcon:
                                  SvgPicture.asset('assets/icons/search.svg'),
                            ),
                          ),
                          DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkCardColor,
                            buttonText: "Create Threads",
                            width: width * .12,
                            height: height * .05,
                            onPressed: () {
                              //Todo: Activate this when this page is build
                              // Get.toNamed('/order/create');
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .05,
                      ),
                      SizedBox(
                          height: height * .6,
                          child: const Center(
                            child: Text('Under Development'),
                          )

                          // ListView.builder(
                          //   scrollDirection: Axis.vertical,
                          //   itemCount: orderController.post.length,
                          //   itemBuilder: (BuildContext context, int index) {
                          //     return Card(
                          //       color: controller.isDarkMode.value
                          //           ? kDarkCardColor
                          //           : kCardColor,
                          //       child: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Row(
                          //           mainAxisAlignment:
                          //               MainAxisAlignment.spaceBetween,
                          //           children: [
                          //             Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     SizedBox(
                          //                       width: width * .06,
                          //                       child: CircleAvatar(
                          //                         backgroundColor: kWhiteColor,
                          //                         radius: 30,
                          //                         child: ClipRRect(
                          //                           borderRadius:
                          //                               BorderRadius.circular(30),
                          //                           child: orderController
                          //                                       .post[index]
                          //                                       .featuredImages !=
                          //                                   null
                          //                               ? Image.network(
                          //                                   orderController
                          //                                       .post[index]
                          //                                       .featuredImages!)
                          //                               : SvgPicture.asset(
                          //                                   '/images/logo.svg',
                          //                                   fit: BoxFit.cover,
                          //                                   width: 30,
                          //                                   height: 30,
                          //                                 ),
                          //                         ),
                          //                       ),
                          //                     ),
                          //                     Padding(
                          //                       padding:
                          //                           const EdgeInsets.all(8.0),
                          //                       child: Column(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment.start,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.start,
                          //                         children: [
                          //                           Text(
                          //                             orderController
                          //                                 .post[index].title!,
                          //                             style: Theme.of(context)
                          //                                 .textTheme
                          //                                 .bodyLarge,
                          //                           ),
                          //                           const SizedBox(
                          //                             height: 10,
                          //                           ),
                          //                           Row(
                          //                             children: [
                          //                               Text(
                          //                                 "Status: ",
                          //                                 style: Theme.of(context)
                          //                                     .textTheme
                          //                                     .bodySmall,
                          //                               ),
                          //                               orderController
                          //                                           .post[index]
                          //                                           .status ==
                          //                                       true
                          //                                   ? Text(
                          //                                       "Active",
                          //                                       style: Theme.of(
                          //                                               context)
                          //                                           .textTheme
                          //                                           .bodySmall!
                          //                                           .copyWith(
                          //                                               color: Colors
                          //                                                   .green),
                          //                                     )
                          //                                   : Text(
                          //                                       'UnPublished',
                          //                                       style: Theme.of(
                          //                                               context)
                          //                                           .textTheme
                          //                                           .bodySmall!
                          //                                           .copyWith(
                          //                                               color: Colors
                          //                                                   .red),
                          //                                     ),
                          //                             ],
                          //                           ),
                          //                         ],
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //             Column(
                          //               children: [
                          //                 Row(
                          //                   children: [
                          //                     IconButton(
                          //                       onPressed: () async {
                          //                         await orderController
                          //                             .getPostById(
                          //                           orderController.post[index].id
                          //                               .toString(),
                          //                         );
                          //                         Get.toNamed('/order/create');
                          //                       },
                          //                       icon: SvgPicture.asset(
                          //                           "assets/icons/edit.svg"),
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 20,
                          //                     ),
                          //                     IconButton(
                          //                       icon: const Icon(
                          //                           Icons.preview_rounded),
                          //                       onPressed: () async {},
                          //                     ),
                          //                     const SizedBox(
                          //                       width: 20,
                          //                     ),
                          //                     IconButton(
                          //                       onPressed: () async {
                          //                         print('order deleted pressed');
                          //                         print(orderController
                          //                             .post[index].id!
                          //                             .toString());
                          //                         print(orderController
                          //                             .post[index].title);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .propertyNumber);
                          //                         print(orderController
                          //                             .post[index].description);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .featuredImages);
                          //                         print(orderController
                          //                             .post[index].galleryImages);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .longDescription);
                          //                         print(orderController
                          //                             .post[index].longitude);
                          //                         print(orderController
                          //                             .post[index].latitude);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .propertyNumber);
                          //                         print(orderController
                          //                             .post[index].price);
                          //                         print(orderController
                          //                             .post[index].city);
                          //                         print(orderController
                          //                             .post[index].area);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .isInstallmentAvailable);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .showContactDetails);
                          //                         print(orderController
                          //                             .post[index].advanceAmount);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .noOfInstallments);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .monthlyInstallments);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .readyForPossession);
                          //                         print(orderController
                          //                             .post[index].areaSizeUnit);
                          //                         print(orderController
                          //                             .post[index].purpose);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .amenitiesIconCodes);
                          //                         print(orderController
                          //                             .post[index]
                          //                             .amenitiesNames);
                          //                         print(orderController
                          //                             .post[index].categoryId);

                          //                         await orderController.delete(
                          //                             orderController
                          //                                 .post[index].id!
                          //                                 .toString(),
                          //                             orderController
                          //                                 .post[index].title!,
                          //                             orderController.post[index]
                          //                                 .propertyNumber!,
                          //                             orderController.post[index]
                          //                                 .description!,
                          //                             orderController.post[index]
                          //                                 .featuredImages!,
                          //                             orderController.post[index]
                          //                                 .galleryImages!,
                          //                             orderController
                          //                                 .post[index].video!,
                          //                             orderController.post[index]
                          //                                 .longDescription!,
                          //                             orderController
                          //                                 .post[index].longitude!,
                          //                             orderController
                          //                                 .post[index].latitude!,
                          //                             orderController.post[index]
                          //                                 .plotNumber!,
                          //                             orderController
                          //                                 .post[index].price!,
                          //                             orderController
                          //                                 .post[index].city!,
                          //                             orderController
                          //                                 .post[index].area!,
                          //                             orderController.post[index]
                          //                                 .isInstallmentAvailable!,
                          //                             orderController.post[index]
                          //                                 .showContactDetails!,
                          //                             orderController.post[index]
                          //                                 .advanceAmount!,
                          //                             orderController.post[index]
                          //                                 .noOfInstallments!,
                          //                             orderController.post[index]
                          //                                 .monthlyInstallments!,
                          //                             orderController.post[index]
                          //                                 .readyForPossession!,
                          //                             orderController.post[index]
                          //                                 .areaSizeUnit!,
                          //                             orderController
                          //                                 .post[index].purpose!,
                          //                             orderController.post[index]
                          //                                 .totalAreaSize!,
                          //                             orderController
                          //                                 .post[index].bedroooms!,
                          //                             orderController
                          //                                 .post[index].bathroom!,
                          //                             orderController.post[index]
                          //                                 .amenitiesIconCodes!,
                          //                             orderController.post[index]
                          //                                 .amenitiesNames!,
                          //                             orderController.post[index]
                          //                                 .categoryId!,
                          //                             orderController.post[index]
                          //                                 .subCategoryId!);
                          //                       },
                          //                       icon: SvgPicture.asset(
                          //                         "assets/icons/trash.svg",
                          //                       ),
                          //                     ),
                          //                   ],
                          //                 ),
                          //               ],
                          //             ),
                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // ),
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
