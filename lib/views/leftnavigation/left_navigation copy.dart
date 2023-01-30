// import 'package:flutter/material.dart';
// import 'package:frontend_grounda/models/MenuModel.dart';
// import 'package:frontend_grounda/utils/constants.dart';
// import 'package:get/get.dart';

// class LeftNavigation extends StatefulWidget {
//   LeftNavigation({Key? key}) : super(key: key);

//   List<MenuModel> menuItems = [
//     MenuModel(
//         icon: Icons.dashboard,
//         label: "Dashboard",
//         rout: "dashboard",
//         permissions: true),
//     MenuModel(
//       icon: Icons.post_add,
//       label: "Post",
//       rout: "post",
//       permissions: true,
//     ),
//     MenuModel(
//         icon: Icons.place,
//         label: "Project",
//         rout: "project",
//         permissions: true),
//     MenuModel(
//       icon: Icons.build,
//       label: "Agency",
//       rout: "agency",
//       permissions: true,
//     ),
//     MenuModel(
//       icon: Icons.build,
//       label: "Agency",
//       rout: "agency",
//       permissions: true,
//     ),
//     MenuModel(
//       icon: Icons.logout,
//       label: "Log Out",
//       rout: "logout",
//       permissions: true,
//     ),
//   ];

//   @override
//   _LeftNavigationState createState() => _LeftNavigationState();
// }

// class _LeftNavigationState extends State<LeftNavigation> {
//   bool sidebarNavOpen = false.obs();

//   double xOffset = Get.width / 28.obs();
//   double yOffset = 0.0.obs();

//   void setSidebarState() {
//     xOffset = sidebarNavOpen ? Get.width / 8 : Get.width / 28;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           SizedBox(
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 mainAxisSize: MainAxisSize.max,
//                 children: [
//                   Container(
//                     height: 60.0,
//                   ),
//                   AnimatedContainer(
//                     duration: const Duration(microseconds: 200),
//                     child: Expanded(
//                       child: ListView.builder(
//                         itemCount: widget.menuItems.length,
//                         itemBuilder: (context, index) => Container(
//                           child: InkWell(
//                             onTap: () {
//                               //TODO; add actions
//                             },
//                             child: Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 15.0,
//                                 top: 8.0,
//                                 bottom: 8.0,
//                                 right: 8.0,
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(widget.menuItems[index].icon),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 14.0),
//                                     child: Text(
//                                       widget.menuItems[index].label.toString(),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//           GestureDetector(
//             onTap: () {
//               sidebarNavOpen = !sidebarNavOpen;
//               setSidebarState();
//             },
//             child: Container(
//               transform: Matrix4.translationValues(xOffset, yOffset, 1.0),
//               color: kWhiteColor,
//               width: double.infinity,
//               height: double.infinity,
//               child: const Text("Dashbaord"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
