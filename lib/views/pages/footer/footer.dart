import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("copyrights 2023 - all data rights reserved by Ghrounda.pk",
          style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
