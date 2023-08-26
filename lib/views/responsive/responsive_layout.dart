import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {super.key, required this.mobileBody, required this.desktopBody});

  final Widget mobileBody;
  final Widget desktopBody;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 1010) {
        return mobileBody;
      } else {
        return desktopBody;
      }
    });
  }
}
