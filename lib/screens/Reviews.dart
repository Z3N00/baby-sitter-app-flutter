// // import 'dart:html';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class ReviewsComments extends StatefulWidget {
//   const ReviewsComments({Key? key}) : super(key: key);

//   @override
//   State<ReviewsComments> createState() => _ReviewsCommentsState();
// }

// class _ReviewsCommentsState extends State<ReviewsComments> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         child: Stack(
//           children: [
//             Align(
//               alignment: Alignment.topLeft,
//               child: Container(
//                 width: MediaQuery.of(context).size.width - 30,
//                 height: 90,
//                 decoration: BoxDecoration(
//                   color: Color(0xff7960FB),
//                   borderRadius: BorderRadius.only(
//                     bottomRight: Radius.circular(45),
//                   ),
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 10.0),
//                       child: Text(
//                         '< REVIEWS',
//                         style: GoogleFonts.roboto(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 15.0),
//                       child: CircleAvatar(),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.center,
//               child: Container(
//                 child: ListTile(
//                   leading: CircleAvatar(),
//                   title: Text(
//                     'Phil wilson',
//                     style: TextStyle(fontSize: 17),
//                   ),
//                   subtitle: Text(
//                       'He has watched my two children (ages 4 and 7) twice a week for the entire summer, and they were a joy to work with. {Babysitter name} consistently arrived at our home on time, ready to engage with our kids, with a smile on.'),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
