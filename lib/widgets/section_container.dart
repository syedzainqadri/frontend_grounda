import 'package:flutter/material.dart';
import 'package:frontend_grounda/utils/constants.dart';

class SectionContainer extends StatelessWidget {
  SectionContainer(
      {super.key,
      required this.child,
      required this.title,
      required this.sectionTopPadding});

  Widget child;
  String title;
  double sectionTopPadding = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: sectionTopPadding),
      child: Container(
        decoration: const BoxDecoration(
          color: kFrameColor,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              blurRadius: 2,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: child,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
