import 'package:baby_sitter_app/screens%20ui/MainNav.dart';
// import 'package:baby_sitter_app/screens/ClientMainEntry.dart';

import 'package:baby_sitter_app/screens/splashscreen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'DBtest/home1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pref = await SharedPreferences.getInstance();
  final HomePage = pref.getBool('HomePage') ?? false;
  runApp(MyApp(HomePage: HomePage));
}

final GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);

class MyApp extends StatelessWidget {
  final bool HomePage;
  MyApp({
    Key? key,
    required this.HomePage,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Color(0xff693EFF)
      ),
      home: HomePage
          ? MainNavigation()
          : const Splashscreen1(), //main app entry point
      // home:RealtimeDbTests(),
    );
  }
}
import 'package:baby_sitter_app/screens%20ui/MainNav.dart';
// import 'package:baby_sitter_app/screens/ClientMainEntry.dart';

import 'package:baby_sitter_app/screens/splashscreen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'DBtest/home1.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pref = await SharedPreferences.getInstance();
  final HomePage = pref.getBool('HomePage') ?? false;
  runApp(MyApp(HomePage: HomePage));
}

final GoogleSignIn _googlesignin = GoogleSignIn(scopes: ['email']);

class MyApp extends StatelessWidget {
  final bool HomePage;
  MyApp({
    Key? key,
    required this.HomePage,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        primaryColor: Color(0xff693EFF)
      ),
      home: HomePage
          ? MainNavigation()
          : const Splashscreen1(), //main app entry point
      // home:RealtimeDbTests(),
    );
  }
}
