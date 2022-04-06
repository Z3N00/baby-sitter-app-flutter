// // import 'package:babysitter_flutter/screens/HomePage.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// import 'Availability.dart';
// import 'ClientMainProfile.dart';
// import 'Reviews.dart';
//
// class MainNavigation extends StatefulWidget {
//   const MainNavigation({Key? key}) : super(key: key);
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   final Screens = [
//     HomePage(),
//     AvailabilityPage(),
//     ReviewsComments(),
//     ClientProfile(),
//   ];
//   int index = 0;
//   final items = [
//     Icon(
//       Icons.home,
//       size: 25,
//       color: Colors.white,
//     ),
//     Icon(
//       Icons.calendar_month,
//       size: 25,
//       color: Colors.white,
//     ),
//     Icon(
//       Icons.message,
//       size: 25,
//       color: Colors.white,
//     ),
//     Icon(
//       Icons.person,
//       size: 25,
//       color: Colors.white,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body: Screens[index],
//       bottomNavigationBar: CurvedNavigationBar(
//         animationDuration: const Duration(milliseconds: 300),
//         height: 60,
//         backgroundColor: Colors.transparent,
//         color: Color(0xff693EFF),
//         buttonBackgroundColor: Color(0xff693EFF),
//         items: items,
//         index: index,
//         onTap: (index) => setState(
//               () {
//             this.index = index;
//           },
//         ),
//       ),
//     );
//   }
// }
