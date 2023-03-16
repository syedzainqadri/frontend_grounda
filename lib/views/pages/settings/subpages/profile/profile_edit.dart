import 'dart:typed_data';

import 'package:country_list_pick/country_list_pick.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/authController.dart/auth_controller.dart';
import 'package:frontend_grounda/controllers/profileController.dart/profile_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/dashboard/dashboard_app_bar.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

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
  final ProfileController profileController = Get.find<ProfileController>();
  final AuthController authController = Get.find<AuthController>();
  var countryName = 'PK'.obs;
  var countryCode = ''.obs;
  double height = Get.height;
  double width = Get.width;
  Location location = Location();
  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var userId = 1.obs;
  var imageUrl = ''.obs;

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
              InkWell(
                child: Obx(
                  () => CircleAvatar(
                    backgroundColor: kWhiteColor,
                    radius: 100,
                    backgroundImage:
                        const AssetImage('/images/dashboard-logo.png'),
                    foregroundImage: NetworkImage(
                      imageUrl.value,
                    ),
                    // child: Center(
                    //   child: imageUrl.value != ''
                    //       ? Image.network(
                    //           imageUrl.value,
                    //           height: 180,
                    //         )
                    //       : SvgPicture.asset(
                    //           '/images/logo.svg',
                    //           fit: BoxFit.cover,
                    //           height: 100,
                    //           width: 100,
                    //         ),
                    // ),
                  ),
                ),
                onTap: () async {
                  await getImage();
                },
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
                    onPressed: () async {
                      await getLocation();
                      print('process started');
                      await profileController.createUserProfile(
                        firstNameController.text,
                        lastNameController.text,
                        address1Controller.text,
                        address2Controller.text,
                        cityNameController.text,
                        stateNameController.text,
                        countryName.value,
                        countryCode.value + phoneNumberController.text,
                        postCodeController.text,
                        longitude.value.toString(),
                        latitude.value.toString(),
                        imageUrl.value,
                        authController.userModel.value.id.toString(),
                      );
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

      // Upload file
      print(fileName);
      var upload = await FirebaseStorage.instance
          .ref('uploads/users/profileImages/$fileName')
          .putData(fileBytes);
      final url =
          upload.ref.getDownloadURL().then((value) => imageUrl.value = value);
      print(imageUrl.value);
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
