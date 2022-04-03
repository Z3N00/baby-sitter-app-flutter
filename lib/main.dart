import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:babysitter_flutter/views/Home.dart';
import 'package:babysitter_flutter/views/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter BabySitter App',
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'JosefinSans',
      ),
      home: AuthService().handleAuth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
