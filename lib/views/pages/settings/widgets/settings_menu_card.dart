// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/constants.dart';
import '../../../../widgets/Buttons.dart';

class SettingsMenuCard extends StatelessWidget {
  SettingsMenuCard(
      {super.key,
      required this.height,
      required this.width,
      required this.icon,
      required this.text,
      required this.onPressed});

  final double height;
  final double width;
  String text;
  String icon;
  dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: kFrameColor,
        child: SizedBox(
          height: height * 0.1,
          width: width * .8,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(icon),
                    SizedBox(
                      width: width * 0.01,
                    ),
                    Text(text),
                  ],
                ),
                DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkColor,
                    buttonText: 'Edit',
                    onPressed: onPressed,
                    width: width * .05,
                    height: height * .03)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
