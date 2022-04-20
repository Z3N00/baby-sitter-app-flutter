import 'package:babycare/screens/splashscreen2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

Future<void> main() async {
  // AccessToken? _accessToken;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // _checkIfisLoggedIn() async {
  //   final accessToken = await FacebookAuth.instance.accessToken;

  //   if (accessToken != null) {
  //     print(accessToken.toJson());
  //     final userData = await FacebookAuth.instance.getUserData();
  //     _accessToken = accessToken;
  //   } else {}
  // }
  // _checkIfisLoggedIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BabyCare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splashscreen1(),


    );
  }
}



// <application android:label="@string/app_name" ...>
//     ...
//    	<meta-data android:name="com.facebook.sdk.ApplicationId" android:value="@string/facebook_app_id"/>
//    	<meta-data android:name="com.facebook.sdk.ClientToken" android:value="@string/facebook_client_token"/>
//     ...
// </application>
