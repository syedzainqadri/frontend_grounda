// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

import '../../../../widgets/maps.dart';

class CustomerForm extends GetView<ThemeChangeController> {
  CustomerForm({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.phoneController,
    required this.phoneTwoController,
    required this.dobController,
    required this.emailController,
    required this.passwordController,
    required this.postCodeController,
    required this.addressLineOneController,
    required this.addressLineTwoController,
    required this.whatsAppController,
    required this.firstNameFieldSubmited,
    required this.firstNameValidator,
    required this.lastNameFieldSubmited,
    required this.lastNameValidator,
    required this.phoneFieldSubmited,
    required this.phoneValidator,
    required this.phoneTwoFieldSubmited,
    required this.phoneTwoValidator,
    required this.dobFieldSubmited,
    required this.dobValidator,
    required this.emailFieldSubmited,
    required this.emailValidator,
    required this.passwordFieldSubmited,
    required this.passwordValidator,
    required this.postCodeFieldSubmited,
    required this.postCodeValidator,
    required this.addressLineOneFieldSubmited,
    required this.addressLineOneValidator,
    required this.whatsAppFieldSubmited,
    required this.whatsAppValidator,
    required this.onFormSubmited,
    required this.firstNameFocus,
    required this.lastNameFocus,
    required this.phoneFocus,
    required this.phoneTwoFocus,
    required this.dobFocus,
    required this.whatsAppFocus,
    required this.emailFocus,
    required this.passwordFocus,
    required this.postCodeFocus,
    required this.addressLineOneFocus,
    required this.addressLineTwoFocus,
    required this.selectState,
    required this.latitude,
    required this.longitude,
    required this.onCancleTap,
  });
  double width = Get.width;
  double height = Get.height;

  //Text Editng Controllers

  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController phoneController;
  TextEditingController phoneTwoController;
  TextEditingController dobController;
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController postCodeController;
  TextEditingController addressLineOneController;
  TextEditingController addressLineTwoController;
  TextEditingController whatsAppController;

  //Functions

  dynamic firstNameFieldSubmited;
  dynamic firstNameValidator;
  dynamic lastNameFieldSubmited;
  dynamic lastNameValidator;
  dynamic phoneFieldSubmited;
  dynamic phoneValidator;
  dynamic phoneTwoFieldSubmited;
  dynamic phoneTwoValidator;
  dynamic dobFieldSubmited;
  dynamic dobValidator;
  dynamic emailFieldSubmited;
  dynamic emailValidator;
  dynamic passwordFieldSubmited;
  dynamic passwordValidator;
  dynamic postCodeFieldSubmited;
  dynamic postCodeValidator;
  dynamic addressLineOneFieldSubmited;
  dynamic addressLineOneValidator;
  dynamic whatsAppFieldSubmited;
  dynamic whatsAppValidator;
  dynamic onFormSubmited;
  dynamic onCancleTap;
  //Focus

  FocusNode firstNameFocus;
  FocusNode lastNameFocus;
  FocusNode phoneFocus;
  FocusNode phoneTwoFocus;
  FocusNode dobFocus;
  FocusNode whatsAppFocus;
  FocusNode emailFocus;
  FocusNode passwordFocus;
  FocusNode postCodeFocus;
  FocusNode addressLineOneFocus;
  FocusNode addressLineTwoFocus;

  //Widgets

  Widget selectState;

  //var

  var latitude;
  var longitude;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height * .9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.23,
                    child: Column(
                      children: [
                        // First Name
                        DefaultTextField(
                          focusNode: firstNameFocus,
                          onFieldSubmitted: firstNameFieldSubmited,
                          hintText: "First Name",
                          labelText: "First Name",
                          isPassword: false,
                          textEditingController: firstNameController,
                          validator: firstNameValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Last Name
                        DefaultTextField(
                          focusNode: lastNameFocus,
                          onFieldSubmitted: lastNameFieldSubmited,
                          hintText: "Last name",
                          labelText: "Last name",
                          isPassword: false,
                          textEditingController: lastNameController,
                          validator: lastNameValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Phone
                        DefaultTextField(
                          focusNode: phoneFocus,
                          onFieldSubmitted: phoneFieldSubmited,
                          hintText: "Phone",
                          labelText: "Phone",
                          isPassword: false,
                          textEditingController: phoneController,
                          validator: phoneValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Phone 2
                        DefaultTextField(
                          focusNode: phoneTwoFocus,
                          onFieldSubmitted: phoneTwoFieldSubmited,
                          hintText: "Phone 2",
                          labelText: "Phone 2",
                          isPassword: false,
                          textEditingController: phoneTwoController,
                          validator: phoneTwoValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Whatsapp Number
                        DefaultTextField(
                          focusNode: whatsAppFocus,
                          onFieldSubmitted: whatsAppFieldSubmited,
                          hintText: "Whatsapp Number",
                          labelText: "Whatsapp Number",
                          isPassword: false,
                          textEditingController: whatsAppController,
                          validator: whatsAppValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        // Whatsapp Number
                        DefaultTextField(
                          focusNode: dobFocus,
                          onFieldSubmitted: dobFieldSubmited,
                          hintText: "Date of Birth",
                          labelText: "Date of Birth",
                          isPassword: false,
                          textEditingController: dobController,
                          validator: dobValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          height: height * 0.012,
                        ),
                        Container(
                          width: width * .25,
                          height: height * .03,
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide())),
                          child: const Text("Customer Login Credentials"),
                        ),
                        SizedBox(
                          width: width * 0.012,
                          height: height * .02,
                        ),
                        // Login Credentials
                        DefaultTextField(
                          focusNode: emailFocus,
                          onFieldSubmitted: emailFieldSubmited,
                          hintText: "E-mail",
                          labelText: "E-mail",
                          isPassword: false,
                          textEditingController: emailController,
                          validator: emailValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          width: width * 0.012,
                        ),
                        // Password - Login Credentials
                        DefaultTextField(
                          focusNode: passwordFocus,
                          onFieldSubmitted: passwordFieldSubmited,
                          hintText: "Password",
                          labelText: "Password",
                          isPassword: false,
                          textEditingController: passwordController,
                          validator: passwordValidator,
                          maxLength: 25,
                        ),
                        SizedBox(
                          width: width * 0.012,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: width * .002,
                    height: height * .15,
                  ),
                  // address
                  SizedBox(
                    width: width * .5,
                    child: Column(
                      children: [
                        SizedBox(
                          width: width * .47,
                          child: const Text("Customer Address and Location"),
                        ),
                        //TODO: check this divider
                        const Padding(
                          padding: EdgeInsets.only(left: 25.0, right: 25),
                          child: Divider(
                            indent: 1,
                            endIndent: 2,
                            height: 1.0,
                            thickness: 1,
                            color: Colors.black,
                          ),
                        ),

                        Row(
                          children: [
                            // address column
                            SizedBox(
                              width: width * 0.25,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .002,
                                    height: height * .050,
                                  ),
                                  // Country

                                  SizedBox(
                                      width: width * .23,
                                      // height: height * .26,
                                      child: selectState),

                                  SizedBox(
                                    width: width * .02,
                                  ),
                                  // Postal Code
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: postCodeFocus,
                                      onFieldSubmitted: postCodeFieldSubmited,
                                      hintText: "Postal Code",
                                      labelText: "Postal Code",
                                      isPassword: false,
                                      textEditingController: postCodeController,
                                      validator: postCodeValidator,
                                      maxLength: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.012,
                                  ),
                                  // Address Line 1
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: addressLineOneFocus,
                                      onFieldSubmitted:
                                          addressLineOneFieldSubmited,
                                      hintText: "Address Line 1",
                                      labelText: "Address Line 1",
                                      isPassword: false,
                                      textEditingController:
                                          addressLineOneController,
                                      validator: addressLineOneValidator,
                                      maxLength: 25,
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.012,
                                  ),
                                  // Address Line 1
                                  SizedBox(
                                    width: width * 0.23,
                                    child: DefaultTextField(
                                      focusNode: addressLineTwoFocus,
                                      hintText: "Address Line 2",
                                      labelText: "Address Line 2",
                                      isPassword: false,
                                      textEditingController:
                                          addressLineTwoController,
                                      maxLength: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.007,
                            ),
                            SizedBox(
                              width: width * 0.20,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: width * .008,
                                    height: height * .05,
                                  ),
                                  Container(
                                    width: width * .22,
                                    height: height * .57,
                                    decoration: BoxDecoration(
                                      color: kDarkCardColor,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: latitude == 0
                                        ? const Center(
                                            child: CircularProgressIndicator(
                                              color: kPrimaryColor,
                                            ),
                                          )
                                        : GoogleMap(
                                            lang: longitude,
                                            lat: latitude,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                    buttonText: "Update",
                    onPressed: onFormSubmited,
                    key: key,
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkCardColor,
                    width: width * .12,
                    height: height * .05,
                  ),
                  SizedBox(
                    width: width * .03,
                  ),
                  InkWell(
                    onTap: onCancleTap,
                    child: Text(
                      'Cancel',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kPrimaryColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
