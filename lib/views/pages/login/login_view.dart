// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/authController.dart/auth_controller.dart';
import 'package:frontend_grounda/controllers/themeController.dart/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

class LoginView extends GetView<ThemeChangeController> {
  LoginView({Key? key}) : super(key: key);

  double height = Get.height;
  double width = Get.width;

  RxBool isObsecure = true.obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Container(
                width: media.width < 768 ? width / 5 : width / 1.3,
                height: media.height < 768 ? height : height / 1.3,
                // width: width / 1.3,
                // height: height / 1.3,
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: kShadowColor,
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                    )
                  ],
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectName,
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 5.0,
                            bottom: 10.0,
                            left: 3.0,
                          ),
                          child: Text(
                              "The most popular real estate market place."),
                        ),
                        DefaultButton(
                          buttonText: "Read More",
                          primaryColor: kPrimaryColor,
                          hoverColor: kDarkColor,
                          width: width / 12,
                          height: height / 20,
                          onPressed: () {},
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: width / 3.5,
                            height: height / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: kPrimaryColor,
                                width: 1.0,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 60, left: 40, bottom: 60),
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(
                                          fontSize: headingTwoSize,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: DefaultTextField(
                                    textEditingController: emailController,
                                    hintText: "Username",
                                    labelText: "Username",
                                    isPassword: false,
                                    prefixIcon: const Icon(Icons.person),
                                  ),
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 20),
                                    child: DefaultTextField(
                                      textEditingController: passwordController,
                                      hintText: "Password",
                                      labelText: "Password",
                                      isPassword: isObsecure.value,
                                      prefixIcon: const Icon(Icons.lock),
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          isObsecure.value =
                                              isObsecure.value ? false : true;
                                        },
                                        icon: isObsecure.value
                                            ? const Icon(Icons.password)
                                            : const Icon(Icons.remove_red_eye),
                                        // icon: const Icon(Icons.remove_red_eye),
                                      ),
                                    ),
                                  ),
                                ),
                                DefaultButton(
                                  primaryColor: kPrimaryColor,
                                  hoverColor: kDarkColor,
                                  buttonText: "Sign In",
                                  onPressed: () async {
                                    Get.defaultDialog(
                                      title: 'Signing In',
                                      content: const CircularProgressIndicator(
                                        color: kPrimaryColor,
                                      ),
                                    );
                                    authController.signIn(
                                        emailController.text.trim(),
                                        passwordController.text);
                                  },
                                  width:
                                      media.width < 768 ? width / 9 : width / 5,
                                  height: height / 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Copyrights 2022 - all rights reserved by $projectName",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
