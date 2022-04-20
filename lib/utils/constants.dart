import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String photourl = '';
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(''),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {},
              icon: const Icon(Icons.logout),
            ),
          ]),
      backgroundColor: const Color(0xff693EFF),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 150,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                 Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        'Baby Sitter',
                        style: GoogleFonts.praise(
                          color: const Color(0xff693EFF),
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SingleBabySitter(),
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }





}

class SingleBabySitter extends StatelessWidget {
  const SingleBabySitter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 50,
       
        decoration: BoxDecoration(
            color: const Color(0xffEEF1F5),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Text(
                  // BabysitterName,
                  'Baby Sitter name',
                  // BabySitterName,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff6043F5),
                  ),
                ),
               Row(
                  children: const [
                    Icon(Icons.star),
                    Text(
                      '4.7',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff6043F5),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   (MaterialPageRoute(
                    //     builder: (context) => ViewProf(),
                    //   )),
                    // );
                  },
                  child: const Text('View Profile'),
                ),
                // customallBtn(Color(0xff6043F5),'View Profile',context),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // child: Image.network(SitterImage),
                child: Image.asset('assets/niki.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
