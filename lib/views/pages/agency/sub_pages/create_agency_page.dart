import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/agencyController/agency_controller.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class CreateAgency extends GetView<ThemeChangeController> {
  CreateAgency({super.key});

  TextEditingController agencyNameController = TextEditingController();
  TextEditingController agencyEmailController = TextEditingController();
  TextEditingController agencyPhoneController = TextEditingController();
  TextEditingController agencyPasswordController = TextEditingController();
  HtmlEditorController htmlEditorController = HtmlEditorController();
  TextEditingController countryNameController = TextEditingController();
  ScrollController scrollController =
      ScrollController(initialScrollOffset: 00.0);
  AgencyController agencyController = Get.find<AgencyController>();
  var height = Get.height;
  var width = Get.width;
  //TODO: replace with api call from area api
  String selectedValue = "USA";
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height * .8,
        width: width * .8,
        decoration: BoxDecoration(
          color: controller.isDarkMode.value ? kDarkFrameColor : kFrameColor,
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
          padding: const EdgeInsets.only(
            bottom: 25.0,
            top: 10,
            right: 20,
            left: 20,
          ),
          child: Obx(
            () => Row(
              children: [
                //form
                SizedBox(
                  width: width * .2,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Focus(
                      focusNode: agencyController.formFocus,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20.0),
                              child: ClipOval(
                                child: SizedBox.fromSize(
                                  size:
                                      const Size.fromRadius(48), // Image radius
                                  child: agencyController.logo.value == ''
                                      ? CircleAvatar(
                                          backgroundColor: kDarkCardColor,
                                          child: IconButton(
                                            icon: const Icon(Icons.add),
                                            onPressed: () {
                                              agencyController.getAgencyLogo();
                                            },
                                          ))
                                      : Image.network(
                                          agencyController.logo.value,
                                          fit: BoxFit.cover),
                                ),
                              ),
                            ),
                            DefaultTextField(
                              autofocus: true,
                              maxLength: 22,
                              hintText: 'Name',
                              labelText: 'Name',
                              isPassword: false,
                              textEditingController: agencyNameController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyEmailFieldFocus);
                              },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Agency Name cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 50,
                              hintText: 'Agency Email',
                              labelText: 'Agency Email',
                              isPassword: false,
                              textEditingController: agencyEmailController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyPhoneFieldFocus);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value == '' ||
                                    !GetUtils.isEmail(value)) {
                                  return 'Email cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 14,
                              hintText: 'Agency Phone',
                              labelText: 'Agency Phone',
                              isPassword: false,
                              textEditingController: agencyPhoneController,
                              onFieldSubmitted: (value) {
                                FocusScope.of(context).requestFocus(
                                    agencyController.agencyPasswordFieldFocus);
                              },
                              validator: (value) {
                                if (value == null ||
                                    value == '' ||
                                    !GetUtils.isPhoneNumber(value)) {
                                  return 'Phone Nummber cannot be empty';
                                }
                              },
                            ),
                            DefaultTextField(
                              maxLength: 14,
                              hintText: 'Password',
                              labelText: 'Password',
                              isPassword: false,
                              textEditingController: agencyPasswordController,
                              // onFieldSubmitted: (value) {
                              //   FocusScope.of(context).requestFocus(
                              //       agencyController.agencyNameFieldFocus);
                              // },
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Password cannot be empty';
                                }
                              },
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Container(
                              height: height * .17,
                              width: width * .2,
                              decoration: const BoxDecoration(
                                color: kWhiteColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20.0),
                                    child: Text(
                                      'Purpose',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: CheckboxListTile(
                                      title: Text(
                                        'Sell',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      value: agencyController.sell.value,
                                      onChanged: (value) {
                                        agencyController.sell.value = value!;
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: CheckboxListTile(
                                      title: Text(
                                        'Rent',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      value: agencyController.rent.value,
                                      onChanged: (value) {
                                        agencyController.rent.value = value!;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height * .02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: controller.isDarkMode == true
                                    ? kDarkCardColor
                                    : kCardColor,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DropdownButton(
                                  borderRadius: BorderRadius.circular(15),
                                  hint: const Text("Select Post Type"),
                                  isExpanded: true,
                                  value: selectedValue,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  underline: Container(
                                    height: 2,
                                    color: Colors.transparent,
                                  ),
                                  onChanged: (value) {},
                                  items: dropdownItems,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .02,
                ),
                //right side
                SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: width * .26,
                            height: height * .2,
                            decoration: BoxDecoration(
                              color: kDarkCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                //TODO: add cover image.
                              },
                            ),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          //TODO: Replace with Map
                          Container(
                            width: width * .26,
                            height: height * .2,
                            decoration: BoxDecoration(
                              color: kDarkCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                //TODO: add cover image.
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width * .26,
                            height: height * .4,
                            decoration: BoxDecoration(
                              color: kCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: HtmlEditor(
                              htmlToolbarOptions: const HtmlToolbarOptions(
                                defaultToolbarButtons: [
                                  FontSettingButtons(),
                                  ColorButtons(),
                                  ListButtons(),
                                ],
                                toolbarItemHeight: 30,
                                toolbarType: ToolbarType.nativeExpandable,
                              ),
                              controller: htmlEditorController, //required
                              htmlEditorOptions: const HtmlEditorOptions(
                                autoAdjustHeight: true,
                                androidUseHybridComposition: true,
                                hint: "Your Description here...",
                                //initalText: "text content initial, if any",
                              ),
                              otherOptions: const OtherOptions(
                                height: 350,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width * .02,
                          ),
                          //TODO: Replace with address details
                          CountryListPick(
                            initialSelection: agencyController.countryName.value
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
                              countryNameController.text = value!.code!;
                              agencyController.countryCode.value =
                                  value.dialCode!;
                              // await getLocation();
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * .02,
                      ),
                      //TODO: Replace with list of categories and sub categories respectively
                      Row(
                        children: [
                          Container(
                            width: width * .54,
                            height: height * .25,
                            decoration: BoxDecoration(
                              color: kDarkCardColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              onPressed: () {
                                //TODO: add cover image.
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
