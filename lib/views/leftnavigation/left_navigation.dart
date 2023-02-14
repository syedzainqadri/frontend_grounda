// import 'package:collapsible_sidebar/collapsible_sidebar.dart';
// import 'package:flutter/material.dart';
// import 'package:frontend_grounda/utils/constants.dart';
// import 'package:get/get.dart';

// class LeftNavigation extends StatelessWidget {
//   LeftNavigation({Key? key}) : super(key: key);

//   List<CollapsibleItem> menuItems = [
//     CollapsibleItem(
//         icon: Icons.dashboard,
//         text: "Dashboard",
//         isSelected: true,
//         onPressed: () {}),
//     CollapsibleItem(
//         icon: Icons.post_add, text: "Post", isSelected: true, onPressed: () {}),
//     CollapsibleItem(
//         icon: Icons.place, text: "Project", isSelected: true, onPressed: () {}),
//     CollapsibleItem(
//         icon: Icons.build, text: "Agency", isSelected: true, onPressed: () {}),
//     CollapsibleItem(
//         icon: Icons.build, text: "Agency", isSelected: true, onPressed: () {}),
//     CollapsibleItem(
//         icon: Icons.logout, text: "Log Out", isSelected: true, onPressed: () {})
//   ];

//   final dynamic _avatarImg = Image.network("https://static.vecteezy.com/system/resources/thumbnails/002/002/297/small/beautiful-woman-avatar-character-icon-free-vector.jpg")

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: CollapsibleSidebar(
//         isCollapsed: MediaQuery.of(context).size.width <= 800,
//         items: menuItems,
//         avatarImg: _avatarImg,
//         title: 'John Smith',
//         onTitleTap: () {
//           ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
//         },
//         body: _body(size, context),
//         backgroundColor: Colors.black,
//         selectedTextColor: Colors.limeAccent,
//         textStyle: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
//         titleStyle: const TextStyle(
//             fontSize: 20,
//             fontStyle: FontStyle.italic,
//             fontWeight: FontWeight.bold),
//         toggleTitleStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         sidebarBoxShadow: const [
//           BoxShadow(
//             color: Colors.indigo,
//             blurRadius: 20,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//           BoxShadow(
//             color: Colors.green,
//             blurRadius: 50,
//             spreadRadius: 0.01,
//             offset: Offset(3, 3),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _body(Size size, BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       color: Colors.blueGrey[50],
//       child: Center(
//         child: Transform.rotate(
//           angle: math.pi / 2,
//           child: Transform.translate(
//             offset: Offset(-size.height * 0.3, -size.width * 0.23),
//             child: Text(
//               _headline,
//               style: Theme.of(context).textTheme.displayLarge,
//               overflow: TextOverflow.visible,
//               softWrap: false,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
