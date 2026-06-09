// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:shop_app/src/core/tools/file_importers.dart';

// class CustomTabBar extends StatefulWidget {
//   const CustomTabBar({
//     required this.tabs,
//     required this.children,
//     super.key,
//   });

//   final List<String> tabs;
//   final List<Widget?> children;

//   @override
//   State<CustomTabBar> createState() => _CustomTabBarState();
// }

// class _CustomTabBarState extends State<CustomTabBar> {
//   ValueNotifier<int> currentIndex = ValueNotifier(0);

//   double changePositionedOfLine() {
//     switch (currentIndex.value) {
//       case 0:
//         return 0;
//       case 1:
//         return 78;
//       case 2:
//         return 192;
//       case 3:
//         return 263;
//       default:
//         return 0;
//     }
//   }

//   double changeContainerWidth() {
//     switch (currentIndex.value) {
//       case 0:
//         return 50;
//       case 1:
//         return 80;
//       case 2:
//         return 50;
//       case 3:
//         return 50;
//       default:
//         return 0;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return ValueListenableBuilder(
//       valueListenable: currentIndex,
//       builder: (
//         BuildContext context,
//         int value,
//         Widget? child,
//       ) =>
//           Scaffold(
//         body: SizedBox(
//           width: size.width,
//           height: size.height,
//           child: Column(
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(top: 15),
//                 width: size.width,
//                 height: size.height * 0.05,
//                 child: Stack(
//                   children: [
//                     Positioned(
//                       top: 0,
//                       left: 0,
//                       right: 0,
//                       child: SizedBox(
//                         width: size.width,
//                         height: size.height * 0.04,
//                         child: ListView.builder(
//                             physics: const BouncingScrollPhysics(),
//                             scrollDirection: Axis.horizontal,
//                             itemCount: widget.tabs.length,
//                             itemBuilder: (context, index) {
//                               return Padding(
//                                 padding: EdgeInsets.only(
//                                   left: index == 0 ? 10 : 23,
//                                   top: 7,
//                                 ),
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     currentIndex.value = index;
//                                   },
//                                   child: Text(
//                                     widget.tabs[index],
//                                     style: GoogleFonts.ubuntu(
//                                       fontSize:
//                                           currentIndex.value == index ? 16 : 14,
//                                       fontWeight: currentIndex.value == index
//                                           ? FontWeight.w400
//                                           : FontWeight.w300,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }),
//                       ),
//                     ),
//                     AnimatedPositioned(
//                       curve: Curves.fastLinearToSlowEaseIn,
//                       bottom: 0,
//                       left: changePositionedOfLine(),
//                       duration: const Duration(milliseconds: 500),
//                       child: AnimatedContainer(
//                         margin: const EdgeInsets.only(left: 10),
//                         width: changeContainerWidth(),
//                         height: size.height * 0.008,
//                         decoration: BoxDecoration(
//                           color: Colors.deepPurpleAccent,
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         duration: const Duration(milliseconds: 1000),
//                         curve: Curves.fastLinearToSlowEaseIn,
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: size.height * 0.3),
//                 child: widget.children[currentIndex.value],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
