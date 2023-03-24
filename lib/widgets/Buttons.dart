// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton(
      {super.key,
      required this.primaryColor,
      required this.hoverColor,
      required this.buttonText,
      required this.onPressed,
      required this.width,
      required this.height});

  Color primaryColor;
  Color hoverColor;
  String buttonText;
  double width;
  double height;
  dynamic onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        )),
        backgroundColor: MaterialStateProperty.all(primaryColor),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return hoverColor;
            }
            return null; // Defer to the widget's default.
          },
        ),
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: Center(
          child: Text(
            buttonText,
          ),
        ),
      ),
    );
  }
}
