import 'package:flutter/material.dart';
import 'package:frontend_grounda/utils/constants.dart';

class DefaultTextField extends StatelessWidget {
  DefaultTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.isPassword,
    this.suffixIcon,
    this.prefixIcon,
  });

  String hintText;
  String labelText;
  bool isPassword;
  Widget? prefixIcon;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        suffixIconColor: kDarkColor,
        prefixIcon: prefixIcon,
        prefixIconColor: kDarkColor,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        hintText: hintText,
        label: Text(
          labelText,
          style: const TextStyle(color: kLabelColor),
        ),
        fillColor: kInputBgColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
