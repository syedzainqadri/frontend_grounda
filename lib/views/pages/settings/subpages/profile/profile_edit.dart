import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController address1Controller = TextEditingController();
  final TextEditingController address2Controller = TextEditingController();
  final TextEditingController cityNameController = TextEditingController();
  final TextEditingController stateNameController = TextEditingController();
  final TextEditingController countryNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController postCodeController = TextEditingController();
  var countryName = 'PK'.obs;
  var countryCode = ''.obs;
  double height = Get.height;
  double width = Get.width;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Profile'),
      body: SizedBox(
        height: height * .9,
        width: width * .8,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: kWhiteColor,
                radius: 100,
                child: Center(
                  child: SvgPicture.asset(
                    '/images/logo.svg',
                    fit: BoxFit.cover,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileScreenTextField(
                    controller: firstNameController,
                    hintText: 'Enter First Name',
                    lableText: 'First Name',
                    icon: const Icon(Icons.person),
                  ),
                  ProfileScreenTextField(
                    controller: lastNameController,
                    hintText: 'Enter Last Name',
                    lableText: 'Last Name',
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileScreenTextField(
                    controller: address1Controller,
                    hintText: 'Enter Address',
                    lableText: 'Address Line 1',
                    icon: const Icon(Icons.mail),
                  ),
                  ProfileScreenTextField(
                    controller: address2Controller,
                    hintText: 'Enter Address',
                    lableText: 'Address Line 2',
                    icon: const Icon(Icons.mail),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileScreenTextField(
                    controller: cityNameController,
                    hintText: 'Enter City',
                    lableText: 'City',
                    icon: const Icon(Icons.location_city),
                  ),
                  ProfileScreenTextField(
                    controller: stateNameController,
                    hintText: 'Enter State',
                    lableText: 'State',
                    icon: const Icon(Icons.location_city_sharp),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfileScreenTextField(
                    controller: phoneNumberController,
                    hintText: 'Enter Phone Number',
                    lableText: 'Phone Number',
                    icon: const Icon(Icons.phone),
                  ),
                  ProfileScreenTextField(
                    controller: postCodeController,
                    hintText: 'Enter Post Code',
                    lableText: 'Post Code',
                    icon: const Icon(Icons.local_post_office),
                  ),
                ],
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    width: width * .2,
                    height: height * .05,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kPrimaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          countryName == 'PK'
                              ? const Text(
                                  'Select Your Country',
                                  style: TextStyle(color: kWhiteColor),
                                )
                              : Text(
                                  countryName.string,
                                  style: const TextStyle(color: kWhiteColor),
                                ),
                          CountryListPick(
                            initialSelection: countryName.value,
                            useSafeArea: true,
                            useUiOverlay: true,
                            theme: CountryTheme(
                              labelColor: Colors.black,
                              isShowFlag: true,
                              isShowTitle: false,
                              isShowCode: false,
                              isDownIcon: false,
                              showEnglishName: true,
                            ),
                            onChanged: (value) {
                              countryName.value = value!.name!;
                              countryCode.value = value.dialCode!;
                              print(
                                  'country name: $countryName + country Code: $countryCode');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DefaultButton(
                    primaryColor: kDarkCardColor,
                    hoverColor: kDarkColor,
                    buttonText: 'Cancle',
                    onPressed: () {
                      Get.toNamed('/settings');
                    },
                    width: width * .05,
                    height: height * .02,
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  DefaultButton(
                    primaryColor: kRedColor,
                    hoverColor: kDarkColor,
                    buttonText: 'Delete Profile',
                    onPressed: () {
                      //TODO: Create a Delete Profile Function.
                    },
                    width: width * .07,
                    height: height * .02,
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkColor,
                    buttonText: 'Update',
                    onPressed: () {
                      //TODO: Create an Update function
                    },
                    width: width * .05,
                    height: height * .02,
                  ),
                ],
              ),
              //TODO: Add Image uploading machanisim
              //TODO: Pick Longitude & Latitude
              //Set ispublish as per user decision.
              //Set user Id.
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreenTextField extends StatelessWidget {
  ProfileScreenTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.lableText,
    required this.icon,
  });

  double width = Get.width;
  dynamic controller;
  String hintText;
  String lableText;
  Widget icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: SizedBox(
        width: width * .3,
        child: DefaultTextField(
          textEditingController: controller,
          hintText: hintText,
          labelText: lableText,
          isPassword: false,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
