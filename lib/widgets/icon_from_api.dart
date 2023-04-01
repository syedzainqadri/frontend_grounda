import 'package:flutter/material.dart';
import 'package:frontend_grounda/utils/global_variable.dart';

class IconFromApi extends StatelessWidget {
  IconFromApi({
    super.key,
    required this.icon,
  });

  String icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(
          int.parse(
            icon,
          ),
          fontFamily: iconFontFamily.value),
      size: 20,
    );
  }
}
