import 'package:babycare/screens/choose_signup_option.dart';
import 'package:babycare/screens/facebook_login.dart';
import 'package:babycare/screens/sing_up.dart';

import 'package:flutter/material.dart';
import 'choose_signup_option.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key? key}) : super(key: key);

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Color(0xff6043F5),
                Color(0xff6043F5),
              ],
              stops: [
                0.0,
                1.0
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              tileMode: TileMode.repeated),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Baby Care+',
                  style: GoogleFonts.praise(
                    color: Colors.white,
                    fontSize: 60,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                InkWell(
                  onTap: () async {
                    
                    Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (context) =>   const ChooseAuthOption(userType: 'sitter',),
                            )),
                          );
                  },
                  child: Image.asset('assets/sitter.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Am a Babyitter',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      fontFamily: 'Roboto'),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChooseAuthOption(userType: 'parent',),
                      ),
                    );
                  },
                  child: Image.asset('assets/parent.png'),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Am a Parent',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      fontFamily: 'Roboto'),
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}
