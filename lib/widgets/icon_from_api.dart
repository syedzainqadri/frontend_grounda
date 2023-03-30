import 'package:flutter/material.dart';

class IconFromApiWidget extends StatelessWidget {
  IconFromApiWidget({
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
          fontFamily: "MaterialIcons"),
      size: 20,
    );
  }
}
