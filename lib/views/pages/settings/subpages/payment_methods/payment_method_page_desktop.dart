// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/paymentMethodController/payment_method_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';

import 'package:frontend_grounda/models/paymentMethodModel/payment_method_model.dart';

import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/views/pages/settings/subpages/payment_methods/payment_method_form.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';

import 'package:get/get.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class PaymentMethodPageDesktop extends GetView<ThemeChangeController> {
  PaymentMethodPageDesktop({super.key});

  final TextEditingController searchPaymentMethod = TextEditingController();
  final PaymentMethodController paymentMethodController =
      Get.find<PaymentMethodController>();
  QuillEditorController descriptionController = QuillEditorController();
  TextEditingController paymentMethodNameController = TextEditingController();
  TextEditingController paymentMethodClientKeyController =
      TextEditingController();
  TextEditingController paymentMethodSecretKeyController =
      TextEditingController();
  TextEditingController paymentMethodStatusController = TextEditingController();
  List<AllPaymentMethodsModel> allPaymentMethodsModel = [];

  var selectedItemId = 0.obs;
  var isPublished = ''.obs;
  var paymentMethodId = ''.obs;

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Payment Method'),
      body: Obx(
        () => Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: height * .8,
                width: width * .25,
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
                  padding: const EdgeInsets.all(25.0),
                  child: paymentMethodController.paymentMethods.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        )
                      : PaymentMethodForm(
                          paymentMethodNameController:
                              paymentMethodNameController,
                          paymentMethodClientKeyController:
                              paymentMethodClientKeyController,
                          paymentMethodSecretKeyController:
                              paymentMethodSecretKeyController,
                          paymentMethodStatusController:
                              paymentMethodStatusController,
                          buttonText:
                              paymentMethodId.value == '' ? 'Submit' : 'Update',
                          formSubmit: () async {
                            if (paymentMethodId.value == '') {
                              Get.defaultDialog(
                                title: 'Creating Category',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );

                              await paymentMethodController.create(
                                  paymentMethodNameController.text,
                                  paymentMethodClientKeyController.text,
                                  paymentMethodSecretKeyController.text,
                                  isPublished.value);
                              await paymentMethodController.getAll();
                              Navigator.pop(context);
                            } else {
                              Get.defaultDialog(
                                title: 'Updating Payment Method',
                                content: const Center(
                                  child: CircularProgressIndicator(
                                      color: kPrimaryColor),
                                ),
                              );

                              await paymentMethodController.updatePaymentMethod(
                                  int.parse(paymentMethodId.value),
                                  paymentMethodNameController.text,
                                  paymentMethodClientKeyController.text,
                                  paymentMethodSecretKeyController.text,
                                  isPublished.value);
                              paymentMethodNameController.text = '';
                              paymentMethodClientKeyController.text = '';
                              paymentMethodSecretKeyController.text = '';
                              paymentMethodId.value = '';
                              await paymentMethodController.getAll();
                              Navigator.pop(context);
                            }
                          },
                          cancelText: paymentMethodId.value == ''
                              ? ''
                              : 'Cancel Update',
                          onTap: () async {
                            paymentMethodNameController.text = '';
                            paymentMethodClientKeyController.text = '';
                            paymentMethodSecretKeyController.text = '';
                            descriptionController.clear();
                            selectedItemId.value = 0;
                            paymentMethodId.value = '';
                            await paymentMethodController.getAll();
                          },
                          statusValue:
                              isPublished.value == 'ACTIVE' ? true : false,
                          statusChanges: (value) {
                            isPublished.value = value;
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
                              textEditingController: searchPaymentMethod,
                              hintText: "Search Payment Method",
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
                          itemCount:
                              paymentMethodController.paymentMethods.length,
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
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .name!,
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
                                                      paymentMethodController
                                                                  .paymentMethods[
                                                                      index]
                                                                  .status ==
                                                              'ACTIVE'
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
                                                paymentMethodNameController
                                                        .text =
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .name!;

                                                paymentMethodClientKeyController
                                                        .text =
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .apiKey!;

                                                paymentMethodSecretKeyController
                                                        .text =
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .secret!;

                                                isPublished.value =
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .status!;

                                                paymentMethodId.value =
                                                    paymentMethodController
                                                        .paymentMethods[index]
                                                        .id
                                                        .toString();
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
                                                await paymentMethodController
                                                    .delete(
                                                        paymentMethodController
                                                            .paymentMethods[
                                                                index]
                                                            .id!);
                                                await paymentMethodController
                                                    .getAll();
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
