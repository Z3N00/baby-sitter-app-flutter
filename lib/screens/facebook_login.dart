import 'package:babycare/screens/HomePage.dart';
import 'package:babycare/screens/choose_signup_option.dart';
import 'package:babycare/screens/splashscreen2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class FbLogin extends StatefulWidget {
  const FbLogin({Key? key, required this.userType}) : super(key: key);
  final String userType;
  @override
  State<FbLogin> createState() => _FbLoginState();
}

class _FbLoginState extends State<FbLogin> {
  Map<String, dynamic>? _userData;
  AccessToken? _accessToken;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    _checkIfisLoggedIn();
  }

  _checkIfisLoggedIn() async {
    final accessToken = await FacebookAuth.instance.accessToken;

    setState(() {
      _checking = true;
    });

    if (accessToken != null) {
      print(accessToken.toJson());
      final userData = await FacebookAuth.instance.getUserData();
      _accessToken = accessToken;
      setState(() {
        _userData = userData;
      });
    } else {
      _login();
    }
  }

  _login() async {
    final result = await FacebookAuth.instance.login();
    final AuthCredential facebookCredential =
        FacebookAuthProvider.credential(result.accessToken!.token);
    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(facebookCredential);
    // ignore: avoid_print
    print(userCredential.toString());

    if (result.status == LoginStatus.success) {
      _accessToken = result.accessToken;

      final userData = await FacebookAuth.instance.getUserData();
      _userData = userData;
    } else {
      // ignore: avoid_print
      print(result.status);
      // ignore: avoid_print
      print(result.message);
    }
    setState(() {
      _checking = false;
    });
  }

  _logout() async {
    await FacebookAuth.instance.logOut();
    _accessToken = null;
    _userData = null;
    setState(() {});
    Navigator.push(
      context,
      (MaterialPageRoute(
        builder: (context) => const ChooseAuthOption(
          userType: '',
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_print
    print(_userData);
    return Scaffold(
      body: _checking
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Baby Care+',
                    style: GoogleFonts.praise(
                      color: const Color(0xff693EFF),
                      fontSize: 60,
                    ),
                    //  TextStyle(

                    //   color: Colors.purple,
                    //   fontSize: 30,
                    // ),
                  ),
                ),
                _userData != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' ${_userData!['name']}',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Roboto'),
                        ),
                      )
                    : Container(),
                _userData != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${_userData!['email']}',
                          style: const TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container(),
                _userData != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        // ignore: avoid_unnecessary_containers
                        child: Container(
                          child: Image.network(
                              _userData!['picture']['data']['url']),
                        ),
                      )
                    : Container(),
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                    onTap:_userData != null ? _logout : _login,
                    //  () {
                    //   if (_userData != null) {
                    //     _logout;
                    //     Navigator.push(
                    //       context,
                    //       (MaterialPageRoute(
                    //           builder: (context) => const Splashscreen1())),
                    //     );
                    //   } else {
                    //     _login;
                    //   }
                    // },
                    child: Text(
                      _userData != null ? 'GO BACK' : 'Go to Facebook website',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                _userData != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 80.0),
                        child: Center(
                          child: InkWell(
                              onTap: () {
                                final CollectionReference _usersRef =
                                    FirebaseFirestore.instance
                                        .collection("users");
                                _usersRef
                                    .add({
                                      'address':
                                          'not provided by facebook', // John Doe
                                      'description':
                                          'Light housework is performed. Engages children in enjoyable activities. Keeps the living and play places of youngsters clean. As needed, assists with schoolwork and tutoring. Feeding, diapering, and clothing infants are all part of the job.', // Stokes and Sons
                                      'email': _userData!['email'],
                                      'isSitter': false,
                                      'name': _userData!['name'],
                                      'password': 'N/A. Used Facebook',
                                      'phone': 'Not provided by facebook',
                                      'rating': 'N/A',
                                      'userType': widget.userType,
                                      'ImageUrl': _userData!['picture']['data']
                                          ['url']
                                    })
                                    // ignore: avoid_print
                                    .then((value) => widget.userType == 'parent' ? Navigator.push(
                                          context,
                                          (MaterialPageRoute(
                                            builder: (context) =>
                                                const HomePage(email: "",),
                                          )),
                                        ): Navigator.push(
                                          context,
                                          (MaterialPageRoute(
                                            builder: (context) =>
                                                const Splashscreen1(),
                                          )),
                                        )
                                        )
                                    // ignore: avoid_print
                                    .catchError((error) =>
                                        // ignore: avoid_print
                                        print("Failed to add user: $error"));
                              },
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Proceed to baby care',
                                style: GoogleFonts.praise(
                                  color: const Color(0xff693EFF),
                                  fontSize: 20,
                                ),
                              )),
                        ),
                      )
                    : Container()
              ],
            ),
    );
  }
}
