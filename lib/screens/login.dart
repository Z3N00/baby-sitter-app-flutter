import 'package:babycare/screens/BabySitterHomeScreen.dart';
import 'package:babycare/screens/HomePage.dart';
import 'package:babycare/screens/sitterProfile.dart';
import 'package:babycare/screens/splashscreen2.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Create a Form widget.
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.userType}) : super(key: key);
  final String userType;
  @override
  LoginPageState createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  String email = '';
  String pass = '';
  bool _appLoading = false;
  Future loginWithEmailAndPassword(String emaily, String passwordy) async {
    try {
      final authResult = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emaily, password: passwordy);
      if (authResult.user != null) {

        if (widget.userType == 'sitter'){
          Navigator.push(
            context,
              (MaterialPageRoute(
                builder: (context) => SitterHome(email: emaily,),
              ))
          );
        }else{
          Navigator.push(
            context,
            (MaterialPageRoute(

              builder: (context) =>  HomePage(email: emaily,),
            )),
          );
        }

      }
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Wrong Password',
            style: TextStyle(color: Colors.red),
          )),
        );
      } else if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'User not found',
            style: TextStyle(color: Colors.red),
          )),
        );
      } else if (e.code == 'invalid-email') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
            'Wrong Password',
            style: TextStyle(color: Colors.red),
          )),
        );
      }
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: Text(
                    'Baby Care+',
                    style: GoogleFonts.praise(
                      color: const Color(0xff693EFF),
                      fontSize: 60,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 30, right: 30),
                child: TextFormField(
                  controller: emailController,
                  onSaved: (val) {
                    setState(() {
                      val = email;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      value = email;
                    });
                  },
                  // The validator receives the text that the user has entered.
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    Pattern pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regex = RegExp(pattern.toString());
                    if (!regex.hasMatch(value!)) {
                      return 'Enter Valid Email';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((5)),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((5)),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xff6043F5), width: 2),
                      borderRadius: BorderRadius.circular((5)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: MediaQuery.of(context).size.width * 0.019,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFECEDF1),
                    hintText: 'Email',
                    hintStyle: const TextStyle(
                        color: Color(0xffBDB9B7),
                        fontWeight: FontWeight.w800,
                        fontSize: 8,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 30, right: 30),
                child: TextFormField(
                  controller: passController,
                  // The validator receives the text that the user has entered.
                  onChanged: (value) {
                    setState(() {
                      pass = value;
                    });
                  },
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    RegExp regex = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter paasword containint caps , letters and symbol and number';
                      } else {
                        return null;
                      }
                    }
                  },

                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((5)),
                      borderSide:
                          const BorderSide(color: Colors.transparent, width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular((5)),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: 0.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0xff6043F5), width: 2),
                      borderRadius: BorderRadius.circular((5)),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 36,
                      vertical: MediaQuery.of(context).size.width * 0.019,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFECEDF1),
                    hintText: 'Repeat password',
                    hintStyle: const TextStyle(
                        color: Color(0xffBDB9B7),
                        fontWeight: FontWeight.w800,
                        fontSize: 8,
                        fontFamily: 'Roboto'),
                  ),
                ),
              ),
              _appLoading == false? InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      _appLoading = true;
                    });
                    await loginWithEmailAndPassword(
                      emailController.text.toString(),
                      passController.text.toString(),
                    );
                    setState(() {
                      _appLoading = false;
                    });
                  }
                },
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.72191780,
                      height: MediaQuery.of(context).size.height * 0.060742,
                      decoration: BoxDecoration(
                          color: const Color(0xff6043F5),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: const Center(
                          child: Text(
                        'Log In',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 15,
                            fontFamily: 'Roboto'),
                      )),
                    ),
                  ),
                ),
              ):
              Center(
                      // ignore: sized_box_for_whitespace
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          child: const CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}











































// // ignore_for_file: unused_field, unused_local_variable

// import 'package:babycare/screens/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class SignUPPage extends StatefulWidget {
//   const SignUPPage({Key? key}) : super(key: key);

//   @override
//   State<SignUPPage> createState() => _SignUPPageState();
// }

// class _SignUPPageState extends State<SignUPPage> {
//   // final FocusNode _uidFocusNode = FocusNode();

//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();

//     return firebaseApp;
//   }

  // Future<String?> _createAccount() async {
  //   try {
  //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //         email: 'mwangi@gmail.com', password: '120Pass@');
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'weak-password') {
  //       // ignore: avoid_print
  //       print('The password is weak');
  //     } else if (e.code == 'email-already-in-use') {
  //       return ('The account already exists for that email.');
  //     }
  //     // ignore: avoid_print
  //     print(e.message);
  //   } catch (e) {
  //     return (e.toString());
  //   }
  //   return null;
  // }

//   String? validateName(String value) {
//     if (value.length < 3) {
//       return 'Name must be more than 2 charater';
//     } else {
//       return null;
//     }
//   }

//   String? validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//     if (value.length != 10) {
//       return 'Mobile Number must be of 10 digit';
//     } else {
//       return null;
//     }
//   }

//   String? validateEmail(String value) {
//     Pattern pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = RegExp(pattern.toString());
//     if (!regex.hasMatch(value)) {
//       return 'Enter Valid Email';
//     } else {
//       return null;
//     }
//   }

//   final _formKey = GlobalKey<FormState>();
//   bool _autoValidate = false;
//   late String name;
//   late String email;
//   late int phone;
//   late String address;
//   late String passwordOne;
//   late String passwordTwo;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeFirebase(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Error initializing Firebase');
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//               body: SingleChildScrollView(
//             child: Column(
              // children: [
              //   Center(
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 50.0),
              //       child: Text(
              //         'Baby Care+',
              //         style: GoogleFonts.praise(
              //           color: const Color(0xff693EFF),
              //           fontSize: 60,
              //         ),
              //       ),
              //     ),
              //   ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.82191780,
//                   child: Form(
//                     key: _formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           'Sign Up !',
//                           style: TextStyle(
//                               color: Color(0xff9D9998),
//                               fontWeight: FontWeight.w800,
//                               fontSize: 15,
//                               fontFamily: 'Roboto'),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.name,
                            // decoration: InputDecoration(
                            //   border: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular((5)),
                            //     borderSide: const BorderSide(
                            //         color: Colors.transparent, width: 0),
                            //   ),
                            //   enabledBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular((5)),
                            //     borderSide: const BorderSide(
                            //         color: Colors.grey, width: 0.5),
                            //   ),
                            //   focusedBorder: OutlineInputBorder(
                            //     borderSide: const BorderSide(
                            //         color: Color(0xff6043F5), width: 2),
                            //     borderRadius: BorderRadius.circular((5)),
                            //   ),
                            //   contentPadding: EdgeInsets.symmetric(
                            //     horizontal: 36,
                            //     vertical:
                            //         MediaQuery.of(context).size.width * 0.019,
                            //   ),
                            //   filled: true,
                            //   fillColor: const Color(0xFFECEDF1),
                            //   hintText: 'Name',
                            //   hintStyle: const TextStyle(
                            //       color: Color(0xffBDB9B7),
                            //       fontWeight: FontWeight.w800,
                            //       fontSize: 8,
                            //       fontFamily: 'Roboto'),
                            // ),
//                             // onChanged: (value) => widget.onChange(),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.emailAddress,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.transparent, width: 0),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff6043F5), width: 2),
//                                 borderRadius: BorderRadius.circular((5)),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 36,
//                                 vertical:
//                                     MediaQuery.of(context).size.width * 0.019,
//                               ),
//                               filled: true,
//                               fillColor: const Color(0xFFECEDF1),
//                               hintText: 'Email',
//                               hintStyle: const TextStyle(
//                                   color: Color(0xffBDB9B7),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 8,
//                                   fontFamily: 'Roboto'),
//                             ),
//                             // onChanged: (value) => widget.onChange(),
                            // validator: (value) {
                            //   Pattern pattern =
                            //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            //   RegExp regex = RegExp(pattern.toString());
                            //   if (!regex.hasMatch(value!)) {
                            //     return 'Enter Valid Email';
                            //   } else {
                            //     return null;
                            //   }
                            // },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.phone,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.transparent, width: 0),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff6043F5), width: 2),
//                                 borderRadius: BorderRadius.circular((5)),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 36,
//                                 vertical:
//                                     MediaQuery.of(context).size.width * 0.019,
//                               ),
//                               filled: true,
//                               fillColor: const Color(0xFFECEDF1),
//                               hintText: 'Phone',
//                               hintStyle: const TextStyle(
//                                   color: Color(0xffBDB9B7),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 8,
//                                   fontFamily: 'Roboto'),
//                             ),
//                             // onChanged: (value) => widget.onChange(),
                            // validator: (value) {
                            //   if (value?.length != 10) {
                            //     return 'Mobile Number must be of 10 digit';
                            //   } else {
                            //     return null;
                            //   }
                            // },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.name,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.transparent, width: 0),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff6043F5), width: 2),
//                                 borderRadius: BorderRadius.circular((5)),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 36,
//                                 vertical:
//                                     MediaQuery.of(context).size.width * 0.019,
//                               ),
//                               filled: true,
//                               fillColor: const Color(0xFFECEDF1),
//                               hintText: 'Address',
//                               hintStyle: const TextStyle(
//                                   color: Color(0xffBDB9B7),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 8,
//                                   fontFamily: 'Roboto'),
//                             ),
//                             // onChanged: (value) => widget.onChange(),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter some text';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             obscureText: true,

//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.name,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.transparent, width: 0),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff6043F5), width: 2),
//                                 borderRadius: BorderRadius.circular((5)),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 36,
//                                 vertical:
//                                     MediaQuery.of(context).size.width * 0.019,
//                               ),
//                               filled: true,
//                               fillColor: const Color(0xFFECEDF1),
//                               hintText: 'password',
//                               hintStyle: const TextStyle(
//                                   color: Color(0xffBDB9B7),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 8,
//                                   fontFamily: 'Roboto'),
//                             ),
//                             // onChanged: (value) => widget.onChange(),
                            // validator: (value) {
                            //   RegExp regex = RegExp(
                            //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                            //   if (value!.isEmpty) {
                            //     return 'Please enter password';
                            //   } else {
                            //     if (!regex.hasMatch(value)) {
                            //       return 'Enter valid password';
                            //     } else {
                            //       return null;
                            //     }
                            //   }
                            // },
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.0),
//                           child: TextFormField(
//                             obscureText: true,

//                             style: const TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                             keyboardType: TextInputType.name,
//                             decoration: InputDecoration(
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.transparent, width: 0),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular((5)),
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 0.5),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Color(0xff6043F5), width: 2),
//                                 borderRadius: BorderRadius.circular((5)),
//                               ),
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 36,
//                                 vertical:
//                                     MediaQuery.of(context).size.width * 0.019,
//                               ),
//                               filled: true,
//                               fillColor: const Color(0xFFECEDF1),
//                               hintText: 'Confirm Password',
//                               hintStyle: const TextStyle(
//                                   color: Color(0xffBDB9B7),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 8,
//                                   fontFamily: 'Roboto'),
//                             ),
//                             // onChanged: (value) => widget.onChange(),
//                             validator: (value) {
//                               RegExp regex = RegExp(
//                                   r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//                               if (value!.isEmpty) {
//                                 return 'Please enter password';
//                               } else {
//                                 if (!regex.hasMatch(value)) {
//                                   return 'Enter valid password';
//                                 } else {
//                                   return null;
//                                 }
//                               }
//                             },
//                           ),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             () {
//                               // Validate returns true if the form is valid, or false otherwise.
//                               if (_formKey.currentState!.validate()) {
//                                 // If the form is valid, display a snackbar. In the real world,
//                                 // you'd often call a server or save the information in a database.
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text(
//                                     'Processing Data',
//                                     style: TextStyle(color: Colors.black),
//                                   )),
//                                 );
//                               }
//                             };
//                           },
                        //   child: Center(
                        //     child: Padding(
                        //       padding: const EdgeInsets.only(top: 15.0),
                        //       child: Container(
                        //         width: MediaQuery.of(context).size.width *
                        //             0.72191780,
                        //         height: MediaQuery.of(context).size.height *
                        //             0.060742,
                        //         decoration: BoxDecoration(
                        //             color: const Color(0xff6043F5),
                        //             border: Border.all(),
                        //             borderRadius: BorderRadius.circular(30.0)),
                        //         child: const Center(
                        //             child: Text(
                        //           'Sign Up',
                        //           style: TextStyle(
                        //               color: Colors.white,
                        //               fontWeight: FontWeight.w800,
                        //               fontSize: 15,
                        //               fontFamily: 'Roboto'),
                        //         )),
                        //       ),
                        //     ),
                        //   ),
                        // ),
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               (MaterialPageRoute(
//                                 builder: (context) => const LoginPage(),
//                               )),
//                             );
//                           },
//                           child: const Center(
//                             child: Padding(
//                               padding: EdgeInsets.only(top: 20.0),
//                               child: Text(
//                                 'Already have an Account? Sign In',
//                                 style: TextStyle(
//                                   color: Color(0xff6043F5),
//                                   fontWeight: FontWeight.w800,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ));
//         }
//         return const CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF42A5F5)),
//         );
//       },
//     );
//   }
// }













































// import 'package:babycare/screens/HomePage.dart';
// import 'package:babycare/screens/calendary.dart';
// import 'package:babycare/screens/check_availability.dart';
// import 'package:babycare/screens/splashscreen2.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Future<FirebaseApp> _initializeFirebase() async {
//     FirebaseApp firebaseApp = await Firebase.initializeApp();

//     return firebaseApp;
//   }

//   final _email = TextEditingController();

//   final _password = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: _initializeFirebase(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text('Error initializing Firebase');
//         } else if (snapshot.connectionState == ConnectionState.done) {
//           return Scaffold(
//               body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 Center(
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 50.0),
//                     child: Text(
//                       'Baby Care+',
//                       style: GoogleFonts.praise(
//                         color: const Color(0xff693EFF),
//                         fontSize: 60,
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.82191780,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const SizedBox(
//                         height: 20,
//                       ),
//                       const Text(
//                         'Welcome!',
//                         style: TextStyle(
//                             color: Color(0xff9D9998),
//                             fontWeight: FontWeight.w800,
//                             fontSize: 15,
//                             fontFamily: 'Roboto'),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15.0),
//                         child: TextFormField(
//                           controller: _email,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular((5)),
//                               borderSide: const BorderSide(
//                                   color: Colors.transparent, width: 0),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular((5)),
//                               borderSide: const BorderSide(
//                                   color: Colors.grey, width: 0.5),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color(0xff6043F5), width: 2),
//                               borderRadius: BorderRadius.circular((5)),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 36,
//                               vertical:
//                                   MediaQuery.of(context).size.width * 0.019,
//                             ),
//                             filled: true,
//                             fillColor: const Color(0xFFECEDF1),
//                             hintText: 'Email',
//                             hintStyle: const TextStyle(
//                                 color: Color(0xffBDB9B7),
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 8,
//                                 fontFamily: 'Roboto'),
//                           ),
//                           // onChanged: (value) => widget.onChange(),
//                           // validator: MultiValidator([
//                           //   RequiredValidator(errorText: 'Email Address is required.'),
//                           //   EmailValidator(errorText: 'Use a valid email address.'),
//                           // ]),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15.0),
//                         child: TextFormField(
//                           controller: _password,
//                           style: const TextStyle(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular((5)),
//                               borderSide: const BorderSide(
//                                   color: Colors.transparent, width: 0),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular((5)),
//                               borderSide: const BorderSide(
//                                   color: Colors.grey, width: 0.5),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: const BorderSide(
//                                   color: Color(0xff6043F5), width: 2),
//                               borderRadius: BorderRadius.circular((5)),
//                             ),
//                             contentPadding: EdgeInsets.symmetric(
//                               horizontal: 36,
//                               vertical:
//                                   MediaQuery.of(context).size.width * 0.019,
//                             ),
//                             filled: true,
//                             fillColor: const Color(0xFFECEDF1),
//                             hintText: 'password',
//                             hintStyle: const TextStyle(
//                                 color: Color(0xffBDB9B7),
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 8,
//                                 fontFamily: 'Roboto'),
//                           ),
//                           // onChanged: (value) => widget.onChange(),
//                           // validator: MultiValidator([
//                           //   RequiredValidator(errorText: 'Email Address is required.'),
//                           //   EmailValidator(errorText: 'Use a valid email address.'),
//                           // ]),
//                         ),
//                       ),
//                       InkWell(
                        // onTap: () {
                          // Future<String?> _loginAccount() async {
                          //   try {
                          //     await FirebaseAuth.instance
                          //         .signInWithEmailAndPassword(
                          //             email: 'jup@gmail.com',
                          //             password: '@jup1234');
                          //     return null;
                          //   } on FirebaseAuthException catch (e) {
                          //     if (e.code == 'weak-password') {
                          //       return 'The password provided is too weak.';
                          //     } else if (e.code == 'email-already-in-use') {
                          //       // ignore: avoid_print
                          //       print('Login attempt failed');
                          //     }
                          //     e.message.toString();
                          //     return e.message;
                          //   } catch (e) {
                          //     // ignore: avoid_print
                          //     print(e);
                          //   }
                          // }

                          // _loginAccount();
                        // },
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 15.0),
//                             child: Container(
//                               width: MediaQuery.of(context).size.width *
//                                   0.72191780,
//                               height:
//                                   MediaQuery.of(context).size.height * 0.060742,
//                               decoration: BoxDecoration(
//                                   color: const Color(0xff6043F5),
//                                   border: Border.all(),
//                                   borderRadius: BorderRadius.circular(30.0)),
//                               child: const Center(
//                                   child: Text(
//                                 'Login ',
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w800,
//                                     fontSize: 15,
//                                     fontFamily: 'Roboto'),
//                               )),
//                             ),
//                           ),
//                         ),
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             (MaterialPageRoute(
//                               builder: (context) => const Splashscreen1(),
//                             )),
//                           );
//                         },
//                         child: const Center(
//                           child: Padding(
//                             padding: EdgeInsets.only(top: 20.0),
//                             child: Text(
//                               'Do not have an Account? Sign Up',
//                               style: TextStyle(
//                                 color: Color(0xff6043F5),
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 10,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ));
//         }
//         return const CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF42A5F5)),
//         );
//       },
//     );
//   }
// }
