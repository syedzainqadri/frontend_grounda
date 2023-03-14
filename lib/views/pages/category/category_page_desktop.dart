import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:frontend_grounda/controllers/theme_change_controller.dart';
import 'package:frontend_grounda/utils/constants.dart';
import 'package:frontend_grounda/widgets/Buttons.dart';
import 'package:frontend_grounda/widgets/darkmode/TextFields.dart';
import 'package:get/get.dart';

class CategoryPageDesktop extends GetView<ThemeChangeController> {
  const CategoryPageDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    const bool isMobile = false;
    return SizedBox(
      height: height * .8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width * .5,
                child: DefaultTextField(
                  hintText: "Search Category",
                  labelText: "Search",
                  isPassword: false,
                  suffixIcon: SvgPicture.asset('assets/icons/search.svg'),
                ),
              ),
              SizedBox(
                  width: width * .15,
                  child: DefaultButton(
                    primaryColor: kPrimaryColor,
                    hoverColor: kDarkColor,
                    buttonText: "Create Category",
                    onPressed: () {},
                    width: width < 768 ? width / 9 : width / 5,
                    height: height * .05,
                  )),
            ],
          ),
          SizedBox(
            height: height * .05,
          ),
          SizedBox(
            height: height * .6,
            child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemCount: 5,
              separatorBuilder: (context, index) {
                return const Divider();
              },
              itemBuilder: (BuildContext context, int index) {
                return const ListTile();
                // return Card(
                //   color:
                //       controller.isDarkMode.value ? kDarkCardColor : kCardColor,
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Column(
                //           children: [
                //             Row(
                //               children: [
                //                 SizedBox(
                //                   width: width * .09,
                //                   child: SvgPicture.asset(
                //                       "assets/images/logo.svg"),
                //                 ),
                //                 Padding(
                //                   padding: const EdgeInsets.all(8.0),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         "Buy A Centrally Located 1 Kanal House In Shah Jamal",
                //                         style: Theme.of(context)
                //                             .textTheme
                //                             .bodyLarge,
                //                       ),
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       Row(
                //                         children: [
                //                           Text(
                //                             "Status: ",
                //                             style: Theme.of(context)
                //                                 .textTheme
                //                                 .bodySmall,
                //                           ),
                //                           Text(
                //                             "Active",
                //                             style: Theme.of(context)
                //                                 .textTheme
                //                                 .bodySmall!
                //                                 .copyWith(color: Colors.green),
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //         Column(
                //           children: [
                //             Row(
                //               children: [
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon:
                //                       SvgPicture.asset("assets/icons/edit.svg"),
                //                 ),
                //                 const SizedBox(
                //                   width: 20,
                //                 ),
                //                 IconButton(
                //                   onPressed: () {},
                //                   icon: SvgPicture.asset(
                //                       "assets/icons/trash.svg"),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
