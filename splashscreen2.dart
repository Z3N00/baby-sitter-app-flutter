import 'package:baby_sitter_app/SitterFile/SitterMainentery.dart';
import 'package:baby_sitter_app/screens/signIn.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../SitterFile/Bookings.dart';
import '../SitterFile/SitterSign.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key? key}) : super(key: key);

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  final database = FirebaseDatabase.instance.ref();

  @override
  Widget build(BuildContext context) {
    final BabySitter = database.child('BabySitter');
    final Parent = database.child('Parent');
    return Container(
      child: Scaffold(
        extendBody: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  // Colors.black,
                  Color(0xff6043F5),
                  Color(0xff6043F5),
                ],
                stops: [
                  0.0,
                  // 0.5,
                  1.0
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                tileMode: TileMode.repeated),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Text(
                  'Baby Care+',
                  style: GoogleFonts.praise(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                  //  TextStyle(

                  //   color: Colors.purple,
                  //   fontSize: 30,
                  // ),
                ),
                //  Center(
                //   child: SizedBox(
                //     height: 100,
                //     width: 100,
                //     child: FittedBox(
                //       child: Image.asset('assets/bcare.png'),
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await BabySitter.update({
                        'Sitter': 'BabySitter',
                      });
                    } catch (e) {
                      print('This error was encounted');
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SitterSignInPage(),
                      ),
                    );
                  },
                  child: Image.asset('assets/sitter.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Am a BabySitter',
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    try {
                      await Parent.update(
                          {'Parent Main Entry': 'ParentEntity'});
                    } catch (e) {
                      print('this error was encounted $e');
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                    );
                  },
                  child: Image.asset('assets/parent.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Am a Parent',
                  style: TextStyle(
                    color: Colors.white,
                    // fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
