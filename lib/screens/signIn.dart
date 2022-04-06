import 'package:baby_sitter_app/Authetication/Googlesign.dart';
import 'package:baby_sitter_app/SitterFile/SitterMainentery.dart';
// import 'package:baby_sitter_app/screens/ClientMainEntry.dart';
import 'package:baby_sitter_app/screens/create-account.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:get/route_manager.dart';

import '../customWidgets/CustomWidgets.dart';
// import '../customWidgets/Custombutton.dart';
import '../screens ui/MainNav.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Map? _userData;
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomWidgetContainer(
                      Height: 80, bottomleftRadius: 30, topleftRadius: 0),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Baby Care+',
                      style: GoogleFonts.praise(
                        color: Color(0xff693EFF),
                        fontSize: 60,
                      ),
                      //  TextStyle(

                      //   color: Colors.purple,
                      //   fontSize: 30,
                      // ),
                    ),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customallBtn(
                      Color(0xff6043F5),
                      'Sign In With Email',
                      context,
                    ),
                    CustomizableBTN(
                      'assets/google.png',
                      Color(0xff4285F4),
                      'Sign Up With Google',
                      context,
                    ),
                    CustomizafbLogin(
                      'assets/fb.png',
                      Color(0xff475993),
                      'Sign Up With Facebook',
                      context,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Text(
                        'Already have an Account? Sign Up',
                        style: TextStyle(
                          color: Color(0xff6043F5),
                          fontWeight: FontWeight.w800,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomWidgetContainer(
                  Height: 80, bottomleftRadius: 0, topleftRadius: 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget customallBtn(color, inputTxt, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => CreateAccount(),
          )),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.only(right:15.0,top: 5,bottom: 5),
                  //   child: Image.asset(image),
                  // ),
                  Text(
                    inputTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomizafbLogin(
    image,
    color,
    inputTxt,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        // final results = await FacebookAuth.i.login(
        //   permissions: ['public_profile', 'email'],
        // );
        // if (results.status == LoginStatus.success) {
        //   final requestData = await FacebookAuth.i.getUserData(
        //     fields: 'email,name',
        //   );
        //   setState(() {
        //     _userData = requestData;
        //   });
        // }
        // await authClass.googleSignInfun(context);



        // Navigator.push(
        //   context,
        //   (MaterialPageRoute(builder: (context) => SitterMain())),
        // );





      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15.0, top: 5, bottom: 5),
                    child: Image.asset(image),
                  ),
                  Text(
                    inputTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomizableBTN(
    image,
    color,
    inputTxt,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        await authClass.googleSignInfun(context);
        Navigator.push(
          //unique key required.



          context,
          (MaterialPageRoute(builder: (context) => MainNavigation(uniquekey: '',))),




        );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 100,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 15.0, top: 5, bottom: 5),
                    child: Image.asset(image),
                  ),
                  Text(
                    inputTxt,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
