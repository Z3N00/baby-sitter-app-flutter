// import 'package:baby_sitter_app/screens/ViewProfile.dart';
// import 'package:baby_sitter_app/screens/splashscreen2.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import '../customWidgets/Custombutton.dart';

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   String BabySitterName = 'Enter name';
//   final database = FirebaseDatabase.instance.ref;
//   String photourl = '';
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     activateListeners(context);
//     nameUpdate(context);
//   }

//   void nameUpdate(BuildContext context) {
//     database.call('Sitter Details/name').onValue.listen((event) {
//       final Object? NameofSitter = event.snapshot.value;
//       setState(() {
//         BabySitterName = '$NameofSitter';
//       });
//     });
//   }

//   void activateListeners(BuildContext context) {
//     database
//         .call('Sitter Details/SitterPhofilePhotoUrl')
//         .onValue
//         .listen((event) {
//       final Object? NameofSitter = event.snapshot.value;
//       setState(() {
//         photourl = '$NameofSitter';
//         print("this is photo path" + photourl);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     bool _islogged = false;
//     late GoogleSignInAccount _userObj;

//     GoogleSignIn _googleSignIn = GoogleSignIn();
//     final user = FirebaseAuth.instance.currentUser!;
//     final Babysitter_description = database.call('PersonInputInfo');
//     return Scaffold(
//       appBar: AppBar(
//           title: Text(
//               // 'Hello ${user.displayName}',
//               ''
//               // style: GoogleFonts.praise(
//               //   textStyle: TextStyle(fontSize: 20),
//               // ),
//               ),
//           centerTitle: true,
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.signOut();
//                 _googleSignIn.signOut().then((value) {
//                   setState(() {
//                     _islogged = false;
//                   });
//                 }).catchError((e) {
//                   print('Did not log out $e');
//                 });

//                 final pref = await SharedPreferences.getInstance();
//                 pref.setBool('HomePage', false);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => Splashscreen1(),
//                   ),
//                 );
//               },
//               icon: Icon(Icons.logout),
//             ),
//           ]),
//       backgroundColor: Colors.purple,
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height - 150,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//               child: Stack(
//                 children: [
//                   Center(
//                     child: SingleChildScrollView(
//                       scrollDirection: Axis.vertical,
//                       child: Container(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             // ProfilePreview(
//                             //     photourl, '4.8', BabySitterName, context),
//                             // ProfilePreview('assets/niki.png', '4.7',
//                             //     'Starlet Watson', context),
//                             // ProfilePreview('assets/starlet.png', '4.7',
//                             //     'Starlet Watson', context),
//                             // ProfilePreview('assets/watson.png', '4.7',
//                             //     'Starlet Nikita', context),
//                             FirebaseAnimatedList(
//                               query: Babysitter_description,
//                               itemBuilder: (BuildContext context,
//                                   DataSnapshot snapshot,
//                                   Animation<double> animation,
//                                   int index) {
//                                 Map contact = Map<String, dynamic>.from(
//                                     snapshot.value as Map);

//                                 return ProfilePreview(
//                                     contact, 'assets/niki.png', '4.8', context);
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Align(
//                   //   alignment: Alignment.center,
//                   //   child: ListView(
//                   //     children: [
//                   //       Container(
//                   //         width: 200,
//                   //         height: 200,
//                   //         color: Colors.red,
//                   //       ),
//                   //     ],
//                   //   ),
//                   // )
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: Text(
//                         'Baby Care+',
//                         style: GoogleFonts.praise(
//                           color: Colors.pink,
//                           fontSize: 40,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget ProfilePreview(Map? contact, SitterImage, Rating,
//       /*BabysitterName*/ BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width - 50,
//         height: 212,
//         decoration: BoxDecoration(
//             color: Color(0xffEEF1F5), borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   // BabysitterName,
//                   contact!['name'],
//                   // BabySitterName,
//                   style: TextStyle(
//                     fontSize: 20,
//                     color: Color(0xff6043F5),
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.star),
//                     Text(
//                       Rating,
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Color(0xff6043F5),
//                       ),
//                     ),
//                   ],
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       (MaterialPageRoute(
//                         builder: (context) => ViewProf(),
//                       )),
//                     );
//                   },
//                   child: Text('View Profile'),
//                 ),
//                 // customallBtn(Color(0xff6043F5),'View Profile',context),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 // child: Image.network(SitterImage),
//                 child: Image.asset(SitterImage),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:baby_sitter_app/services/authservices.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final contactinfo = FirebaseDatabase.instance
      .ref()
      .child('PersonInputInfo')
      .orderByChild('firstname');

  Widget contactdetail({Map? contact}) {
    return Container(
      height: 100,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person),
              SizedBox(
                height: 6,
              ),
              Text(
                contact!['firstname'],
              ),
            ],
          )
        ],
      ),
    );
  }

  // List<Object> contactinfo=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Landing here'),
      ),
      body: Center(
        child: FirebaseAnimatedList(
          query: contactinfo,
          itemBuilder: (BuildContext context, DataSnapshot snapshot,
              Animation<double> animation, int index) {
            Map contact = Map<String, dynamic>.from(snapshot.value as Map);

            return contactdetail(contact: contact);
          },
        ),
      ),
    );
  }
}

