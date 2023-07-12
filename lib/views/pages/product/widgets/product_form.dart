// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend_grounda/controllers/themeController/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/buttons.dart';
import 'package:frontend_grounda/widgets/text_fields.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';

class ProductForm extends GetView<ThemeChangeController> {
  ProductForm({
    required this.titleFocus,
    required this.priceFocus,
    required this.salePriceFocus,
    required this.titleFieldSubmit,
    required this.priceSubmit,
    required this.salePriceSubmit,
    required this.productTitleController,
    required this.productTitleValidator,
    required this.priceValidator,
    required this.priceController,
    required this.htmlEditorController,
    required this.productLifeController,
    required this.productLifeValidator,
    required this.statusValue,
    required this.typeList,
    required this.typeOnChange,
    required this.typeValue,
    required this.formSubmit,
    required this.statusChanges,
    required this.buttonText,
    required this.cancelText,
    required this.onTap,
    required this.salePriceController,
    required this.salePriceValidator,
    super.key,
  });

  //General String, int, bool and doubles
  //value will be passed on the page we will consume this widget on
  //the variable will be declared in controller.

  double width = Get.width;
  double height = Get.height;
  String typeValue;
  bool statusValue;
  String buttonText;
  String cancelText;

  //Dropdownlistvalues
  //value will be passed on the page we will consume this widget on
  //the variable will be declared in controller.
  List<DropdownMenuItem<String>> typeList;

  //Focus Nodes for the user to jump from one field to another field
  //value for this focus node will be provided on the page where this specific
  //widget will be consumes.

  FocusNode titleFocus;
  FocusNode priceFocus;
  FocusNode salePriceFocus;

  //Dynamics are the functions subjec to use of the elements they are applied to
  //the functions related to each dynamic are implemented at the file this
  //widget will be consumed.

  dynamic titleFieldSubmit;
  dynamic priceSubmit;
  dynamic salePriceSubmit;
  dynamic productTitleValidator;
  dynamic priceValidator;
  dynamic salePriceValidator;
  dynamic typeOnChange;
  dynamic productLifeValidator;
  dynamic statusChanges;
  dynamic formSubmit;
  dynamic onTap;

  //Text Editing Controller are used to collect text values on any given text field
  //the value will be passed from the page this widget will be consumed on
  //where as actual controller will be passed on the controller.

  TextEditingController productTitleController;
  TextEditingController priceController;
  TextEditingController salePriceController;
  TextEditingController productLifeController;

  //Html Editor is for the text are and html editor.
  //the value will be passed from the page this widget will be consumed on
  //where as actual controller will be passed on the controller.
  HtmlEditorController htmlEditorController;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: SizedBox(
          height: height * 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Product",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: height * 0.015,
              ),
              DefaultTextField(
                autofocus: true,
                focusNode: titleFocus,
                onFieldSubmitted: titleFieldSubmit,
                hintText: "Enter Product Title",
                labelText: "Product Title",
                isPassword: false,
                textEditingController: productTitleController,
                validator: productTitleValidator,
                maxLength: 200,
              ),
              SizedBox(
                height: height * 0.015,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // property type / Price / currency
                  SizedBox(
                    width: width * 0.23,
                    child: DefaultTextField(
                      hintText: "Price",
                      labelText: "Price",
                      isPassword: false,
                      textEditingController: priceController,
                      validator: priceValidator,
                      focusNode: priceFocus,
                      onFieldSubmitted: priceSubmit,
                      maxLength: 50,
                    ),
                  ),
                  SizedBox(
                    width: width * 0.012,
                  ),
                  // property type / Price / currency
                  SizedBox(
                    width: width * 0.23,
                    child: DefaultTextField(
                      hintText: "Sale Price",
                      labelText: "Sale Price",
                      isPassword: false,
                      textEditingController: salePriceController,
                      validator: salePriceValidator,
                      focusNode: salePriceFocus,
                      onFieldSubmitted: salePriceSubmit,
                      maxLength: 25,
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: height * 0.015,
              ),
              // text editor
              //TODO: text editor must not be empty validation please
              SizedBox(
                height: 250,
                child: HtmlEditor(
                  controller: htmlEditorController,
                  htmlEditorOptions: const HtmlEditorOptions(
                      autoAdjustHeight: true,
                      adjustHeightForKeyboard: true,
                      hint: "Product Descrioption"),
                  otherOptions: const OtherOptions(height: 150),
                  htmlToolbarOptions: const HtmlToolbarOptions(
                    defaultToolbarButtons: [
                      FontSettingButtons(),
                      FontButtons(),
                      StyleButtons(),
                      ListButtons(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    width: width * .19,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Select Product Type",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: kPrimaryColor),
                          textAlign: TextAlign.start,
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
                              hint: const Text("Product Type"),
                              isExpanded: true,
                              value: typeValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: Theme.of(context).textTheme.bodyMedium,
                              underline: Container(
                                height: 2,
                                color: Colors.transparent,
                              ),
                              onChanged: typeOnChange,
                              items: typeList,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: width * .02,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: SizedBox(
                      width: width * 0.2,
                      child: DefaultTextField(
                        hintText: "Product Life",
                        labelText: "Product Life in Days",
                        isPassword: false,
                        textEditingController: productLifeController,
                        validator: productLifeValidator,
                        maxLength: 2,
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 0.0),
                child: Transform.scale(
                  scale: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Status",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: width * .01,
                          ),
                          CupertinoSwitch(
                            activeColor: kPrimaryColor,
                            value: statusValue,
                            onChanged: statusChanges,
                          ),
                        ],
                      ),
                      DefaultButton(
                        primaryColor: kPrimaryColor,
                        hoverColor: kDarkColor,
                        buttonText: buttonText,
                        width: width * .2,
                        height: height * .05,
                        onPressed: formSubmit,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.015,
              ),
              Center(
                child: InkWell(
                  onTap: onTap,
                  child: Text(
                    cancelText,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kPrimaryColor),
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
