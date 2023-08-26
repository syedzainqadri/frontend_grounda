// ignore_for_file: must_be_immutable, unrelated_type_equality_checks, use_build_context_synchronously

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/customerController/customer_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:get/get.dart';

import '../widgets/customer_form.dart';

class CreateCustomerPage extends GetView<ThemeChangeController> {
  CreateCustomerPage({Key? key}) : super(key: key);

  final CustomerController customerController = Get.find<CustomerController>();
  final _createCustomerFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Customers'),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 25),
                  child: Focus(
                    focusNode: customerController.formFocus,
                    child: Form(
                      key: _createCustomerFormKey,
                      child: CustomerForm(
                          //<============! First Name Fild ==========>
                          firstNameController:
                              customerController.firstNameController,
                          firstNameFocus: customerController.firstNameFocus,
                          firstNameFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.lastNameFocus);
                          },
                          firstNameValidator: (value) {
                            if (value == null || value == '') {
                              return 'First Name cannot be empty';
                            }
                          },
                          //<============! Last Name Fild ==========>
                          lastNameController:
                              customerController.lastNameController,
                          lastNameFocus: customerController.lastNameFocus,
                          lastNameFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.phoneFocus);
                          },
                          lastNameValidator: (value) {
                            if (value == null || value == '' || value == int) {
                              return 'Last Name cannot be empty';
                            }
                          },
                          //<============! Phone Fild ==========>
                          phoneController: customerController.phoneController,
                          phoneFocus: customerController.phoneFocus,
                          phoneFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.phoneTwoFocus);
                          },
                          phoneValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'Phone Cannot be Empty';
                            }
                          },
                          //<============! Phone Two Fild ==========>
                          phoneTwoController:
                              customerController.phoneTwoController,
                          phoneTwoFocus: customerController.phoneTwoFocus,
                          phoneTwoFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.whatsAppFocus);
                          },
                          phoneTwoValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'Phone Two Cannot be Empty';
                            }
                          },
                          //<============! Whats App Text Field ==========>
                          whatsAppController:
                              customerController.whatsAppController,
                          whatsAppFocus: customerController.whatsAppFocus,
                          whatsAppFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.dobFocus);
                          },
                          whatsAppValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'Phone Two Cannot be Empty';
                            }
                          },
                          //<============! Dob Text Field ==========>
                          dobController: customerController.dobController,
                          dobFocus: customerController.dobFocus,
                          dobFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.emailFocus);
                          },
                          dobValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'DOB Cannot be Empty';
                            }
                          },
                          //<============! email Text Field ==========>
                          emailController: customerController.emailController,
                          emailFocus: customerController.emailFocus,
                          emailFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.passwordFocus);
                          },
                          emailValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'Email Cannot be Empty';
                            }
                          },
                          //<============! password Text Field ==========>
                          passwordController:
                              customerController.passwordController,
                          passwordFocus: customerController.passwordFocus,
                          passwordFieldSubmited: (value) {
                            FocusScope.of(context)
                                .requestFocus(customerController.postCodeFocus);
                          },
                          passwordValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'Password Cannot be Empty';
                            }
                          },
                          //<============! postCode Text Field ==========>
                          postCodeController:
                              customerController.postCodeController,
                          postCodeFocus: customerController.postCodeFocus,
                          postCodeFieldSubmited: (value) {
                            FocusScope.of(context).requestFocus(
                                customerController.addressLineOneFocus);
                          },
                          postCodeValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'PostCode Cannot be Empty';
                            }
                          },
                          //<============! addressLine One Text Field ==========>
                          addressLineOneController:
                              customerController.addressLineOneController,
                          addressLineOneFocus:
                              customerController.addressLineOneFocus,
                          addressLineOneFieldSubmited: (value) {
                            FocusScope.of(context).requestFocus(
                                customerController.addressLineTwoFocus);
                          },
                          addressLineOneValidator: (value) {
                            if (value == null || value == '' || value != int) {
                              return 'AddressLine One Cannot be Empty';
                            }
                          },
                          //<============! addressLine Text Field ==========>
                          addressLineTwoController:
                              customerController.addressLineTwoController,
                          addressLineTwoFocus:
                              customerController.addressLineTwoFocus,
                          //<============! state Selection Widget ==========>
                          selectState: SelectState(
                            onCountryChanged: (String value) {
                              customerController.country.value = value;
                            },
                            onCityChanged: (String value) {
                              customerController.state.value = value;
                            },
                            onStateChanged: (String value) {
                              customerController.city.value = value;
                            },
                          ),

                          //<============! Longitude / latitude ==========>
                          latitude: customerController.latitude,
                          longitude: customerController.longitude,

                          //submit button
                          onFormSubmited: () async {
                            //todo: Create a function here API call
                          },
                          onCancleTap: () {
                            //Todo: create Cancle fucntion here
                          }),
                    ),
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
