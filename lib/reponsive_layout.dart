import 'package:flutter/material.dart';
import 'package:frontend_grounda/utils/global_variable.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.webLayout,
    required this.mobileLayout,
  });

  final Widget webLayout;
  final Widget mobileLayout;

  static bool isMobile() => width.value < 700;
  static bool isDesktop() => width.value >= 700;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 700) {
          return webLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
