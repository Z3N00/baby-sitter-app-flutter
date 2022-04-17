// // import 'package:baby_sitter_app/screens/Reviews.dart';

// import 'package:flutter/material.dart';

// // import '../Dates/dates.dart';
// // import '../screens ui/Availability.dart';

// // import 'chooseServices.dart';
// // import 'chooseServices.dart';

// class ViewProf extends StatefulWidget {
//   ViewProf(
//       {Key? key,
//       required this.nameofSitter,
//       required this.uniquekey,
//       required this.parentKey})
//       : super(key: key);
//   String parentKey;
//   String nameofSitter;
//   String uniquekey;

//   @override
//   State<ViewProf> createState() => _ViewProfState();
// }

// class _ViewProfState extends State<ViewProf> {
//   late DateTime date;
//   String BabySitterdescrip = 'Hello am a baby sitter';
//   // final database = FirebaseDatabase.instance.ref;
//   String photourl = '';
//   bool isfavourite = false;

//   String name = 'name';

//   String getTxt() {
//     if (date == null) {
//       return 'select Date';
//     } else {
//       return '${date.month}//${date.day}//${date.year}';
//     }
//   }

//   Future pickDate(BuildContext context) async {
//     final intialDate = DateTime.now();
//     final newDate = await showDatePicker(
//       context: context,
//       initialDate: intialDate,
//       firstDate: DateTime(DateTime.now().year - 5),
//       lastDate: DateTime(DateTime.now().year + 5),
//     );
//     if (newDate == null) return;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // final Babysitter_description = database.call('Sitter Details');

//     // ignore: sized_box_for_whitespace
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             Align(
//               alignment: Alignment.topCenter,
//               child: SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.asset('assets/babysitter.png')),
//             ),
//             Align(
//               alignment: Alignment.bottomCenter,
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height - 200,
//                 decoration: const BoxDecoration(
//                   // color: Colors.blueGrey,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(30),
//                   ),
//                 ),
//                 child: Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Align(
//                         alignment: Alignment.topLeft,
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(
//                                     right: 150, bottom: 00.0),
//                                 child: SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       SizedBox(
//                                         // color: Colors.blue,
//                                         width: 100,
//                                         height: 140,
//                                         child: Center(
//                                           child: ClipRRect(
//                                               borderRadius:
//                                                   BorderRadius.circular(8.0),
//                                               child: Image.asset(
//                                                   'assets/niki.png')),
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:8.0,top:10),
//                                         child: Column(
//                                           children: [
//                                             Text(
//                                               widget.nameofSitter,
//                                               style: const TextStyle(
//                                                 fontSize: 15,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Color(0xff6043F5),
//                                                 fontFamily: 'Roboto',
//                                               ),
//                                             ),
//                                             Row(
//                                               children: const [
//                                                 Icon(
//                                                   Icons.star,
//                                                   color: Colors.orange,
//                                                   size: 10,
//                                                 ),
//                                                 Text(
//                                                   '4.7 Reviews (56)',
//                                                   style: TextStyle(
//                                                     fontSize: 10,
                                                    
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                             Row(
//                                               children: const [
//                                                 Text(
//                                                   'Montreal Quebec',
//                                                   style: TextStyle(
//                                                     fontSize: 10,
//                                                     color: Colors.grey,
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 09,
//                       right: 10,
//                       child: FloatingActionButton(
//                         backgroundColor: Colors.white,
//                         onPressed: () {
//                           setState(() {
//                             isfavourite = !isfavourite;
//                           });
//                         },
//                         child: !isfavourite
//                             ? const Icon(
//                                 Icons.favorite_border_outlined,
//                                 color: Colors.black,
//                               )
//                             : const Icon(
//                                 Icons.favorite,
//                                 color: Color(0xff693EFF),
//                               ),
//                       ),
//                     ),
//                     Container(height: 23,width: 23,color: Colors.red,),
//                     Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Padding(
//                         padding: const EdgeInsets.only(bottom: 2.0),
//                         child: SizedBox(
//                           width: 329,
//                           height: 52.34,
//                           child: ElevatedButton(
//                             onPressed: () {},
//                             child: const Text(
//                               'Check Availability',
//                               style: TextStyle(fontSize: 18),
//                             ),
//                           ),
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget reviewListTile(message, name) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 40,
//           backgroundImage: ExactAssetImage('assets/wilson.png'),
//         ),
//         title: Text(
//           name,
//           style: TextStyle(
//             color: Color(0xff6043F5),
//           ),
//         ),
//         subtitle: Text(message),
//       ),
//     );
//   }
// }
