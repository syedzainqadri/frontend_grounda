// ignore_for_file: must_be_immutable, unused_local_variable

import 'dart:typed_data';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/authController/auth_controller.dart';
import 'package:frontend_grounda/controllers/profileController/profile_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class ProfileEditPage extends StatelessWidget {
  ProfileEditPage({super.key});
  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.find<AuthController>();
  double height = Get.height;
  double width = Get.width;
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DashBoardAppBar(title: 'Profile'),
      body: SizedBox(
        height: height * .9,
        width: width * .8,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Obx(
                    () => profileController.profile.value.images == null
                        ? Center(
                            child: SizedBox(
                                width: width * .05,
                                child: const CircularProgressIndicator(
                                    color: kPrimaryColor)),
                          )
                        : CircleAvatar(
                            radius: 100,
                            backgroundColor: Colors.transparent,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: profileController.profile.value.images !=
                                      null
                                  ? Image.network(
                                      profileController.profile.value.images!,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      profileController.imageUrl.value,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          ),
                  ),
                  onTap: () async {
                    Get.defaultDialog(
                      title: 'Uploading Picture',
                      content: const CircularProgressIndicator(
                        color: kPrimaryColor,
                      ),
                    );
                    await getImage();
                    Navigator.pop(context);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileScreenTextField(
                      controller: profileController.firstNameController.value,
                      hintText: 'Enter First Name',
                      lableText: 'First Name',
                      icon: const Icon(Icons.person),
                    ),
                    ProfileScreenTextField(
                      controller: profileController.lastNameController.value,
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
                      controller: profileController.address1Controller.value,
                      hintText: 'Enter Address',
                      lableText: 'Address Line 1',
                      icon: const Icon(Icons.mail),
                    ),
                    ProfileScreenTextField(
                      controller: profileController.address2Controller.value,
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
                      controller: profileController.cityNameController.value,
                      hintText: 'Enter City',
                      lableText: 'City',
                      icon: const Icon(Icons.location_city),
                    ),
                    ProfileScreenTextField(
                      controller: profileController.stateNameController.value,
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
                      controller: profileController.phoneNumberController.value,
                      hintText: 'Enter Phone Number',
                      lableText: 'Phone Number',
                      icon: const Icon(Icons.phone),
                    ),
                    ProfileScreenTextField(
                      controller: profileController.postCodeController.value,
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
                            profileController.countryName.value == ''
                                ? const Text(
                                    'Select Your Country',
                                    style: TextStyle(color: kWhiteColor),
                                  )
                                : Text(
                                    profileController.countryName.value,
                                    style: const TextStyle(color: kWhiteColor),
                                  ),
                            CountryListPick(
                              initialSelection: profileController
                                  .countryName.value
                                  .toLowerCase(),
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
                              onChanged: (value) async {
                                profileController.countryNameController.value
                                    .text = value!.code!;
                                profileController.countryCode.value =
                                    value.dialCode!;
                                await getLocation();
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contact Details',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: kPrimaryColor),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileScreenTextField(
                      controller: profileController.landlineController.value,
                      hintText: 'Land Line',
                      lableText: 'Enter Land Line Number',
                      icon: const Icon(Icons.phone),
                    ),
                    ProfileScreenTextField(
                      controller: profileController.emailController.value,
                      hintText: 'Email',
                      lableText: 'Enter Email Address',
                      icon: const Icon(Icons.email),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ProfileScreenTextField(
                      controller: profileController
                          .contactMobileNumberCodeController.value,
                      hintText: 'Contact Mobile Number',
                      lableText: 'Enter Mobile Number',
                      icon: const Icon(Icons.mobile_friendly),
                    ),
                    ProfileScreenTextField(
                      controller:
                          profileController.contactPersonNameController.value,
                      hintText: 'Contact Persons Name',
                      lableText: 'Enter Contact Persons Name',
                      icon: const Icon(Icons.person),
                    ),
                  ],
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
                      buttonText: 'Delete',
                      onPressed: () async {
                        Get.defaultDialog(
                          title: 'Deleting Profile',
                          content: const CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        );
                        await profileController.delete(
                            profileController.profile.value.id!.toString());
                        Navigator.pop(context);
                        Get.toNamed('/settings');
                      },
                      width: width * .07,
                      height: height * .02,
                    ),
                    SizedBox(
                      width: width * .02,
                    ),
                    profileController.firstNameController.value.text != ''
                        ? DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkColor,
                            buttonText: 'Create',
                            onPressed: () async {
                              Get.defaultDialog(
                                title: 'Creating Profile',
                                content: const CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );
                              var userId =
                                  profileController.tokenHiveBox.get('userId');
                              int userId0 = int.parse(userId);
                              await profileController.createUserProfile(
                                  profileController
                                      .firstNameController.value.text,
                                  profileController
                                      .lastNameController.value.text,
                                  profileController
                                      .address1Controller.value.text,
                                  profileController
                                      .address2Controller.value.text,
                                  profileController
                                      .cityNameController.value.text,
                                  profileController
                                      .stateNameController.value.text,
                                  profileController
                                      .countryNameController.value.text,
                                  profileController.countryCode.value +
                                      profileController
                                          .phoneNumberController.value.text,
                                  profileController
                                      .postCodeController.value.text,
                                  longitude.value.toString(),
                                  latitude.value.toString(),
                                  profileController.imageUrl.value,
                                  userId0,
                                  profileController.emailController.value.text,
                                  profileController
                                      .contactMobileNumberCodeController
                                      .value
                                      .text,
                                  profileController
                                      .landlineController.value.text,
                                  profileController
                                      .contactPersonNameController.value.text,
                                  "SELLER");
                            },
                            width: width * .05,
                            height: height * .02,
                          )
                        : DefaultButton(
                            primaryColor: kPrimaryColor,
                            hoverColor: kDarkColor,
                            buttonText: 'Update',
                            onPressed: () async {
                              Get.defaultDialog(
                                title: 'Updating Profile',
                                content: const CircularProgressIndicator(
                                  color: kPrimaryColor,
                                ),
                              );

                              await profileController.updateUserProfile(
                                  profileController
                                      .firstNameController.value.text,
                                  profileController
                                      .lastNameController.value.text,
                                  profileController
                                      .address1Controller.value.text,
                                  profileController
                                      .address2Controller.value.text,
                                  profileController
                                      .cityNameController.value.text,
                                  profileController
                                      .stateNameController.value.text,
                                  profileController
                                      .countryNameController.value.text,
                                  profileController.countryCode.value +
                                      profileController
                                          .phoneNumberController.value.text,
                                  profileController
                                      .postCodeController.value.text,
                                  longitude.value.toString(),
                                  latitude.value.toString(),
                                  profileController.imageUrl.value,
                                  profileController.profile.value.id!,
                                  profileController.emailController.value.text,
                                  profileController
                                      .contactMobileNumberCodeController
                                      .value
                                      .text,
                                  profileController
                                      .landlineController.value.text,
                                  profileController
                                      .contactPersonNameController.value.text,
                                  "SELLER");
                              Navigator.pop(context);
                            },
                            width: width * .05,
                            height: height * .02,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    latitude.value = _locationData.latitude!;
    longitude.value = _locationData.longitude!;
  }

  getImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      Uint8List fileBytes = result.files.first.bytes!;
      String fileName = result.files.first.name;
      var upload = await FirebaseStorage.instance
          .ref('uploads/users/profileImages/$fileName')
          .putData(fileBytes);
      final url = upload.ref.getDownloadURL().then((value) {
        profileController.imageUrl.value = value;
      });
    }
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
