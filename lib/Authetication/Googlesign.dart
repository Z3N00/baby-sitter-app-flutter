import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

// GetprofileImage(){
//   if()

// }

class AuthClass {
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ]);
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<void> googleSignInfun(BuildContext context) async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
            idToken: googleSignInAuthentication.idToken,
            accessToken: googleSignInAuthentication.accessToken);

        UserCredential userCredential =
            await auth.signInWithCredential(credential);
        try {
          UserCredential userCredential =
              await auth.signInWithCredential(credential);
        } catch (e) {
          final Snackbar = SnackBar(
            content: Text(
              'Not Able to Sign in',
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(Snackbar);
        }
      } else {}
    } catch (e) {
       final Snackbar = SnackBar(
            content: Text(
              e.toString(),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(Snackbar);
    }
  }
}

// modified code





