import 'package:babycare/screens/facebook_login.dart';
import 'package:babycare/screens/login.dart';
import 'package:babycare/screens/sing_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customWidgets/CustomWidgets.dart';

class ChooseAuthOption extends StatefulWidget {
  const ChooseAuthOption({Key? key, required this.userType}) : super(key: key);
  final String userType;
  @override
  State<ChooseAuthOption> createState() => _ChooseAuthOptionState();
}

class _ChooseAuthOptionState extends State<ChooseAuthOption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
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
                        color: const Color(0xff693EFF),
                        fontSize: 60,
                      ),
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
                      const Color(0xff6043F5),
                      'Sign Up with Email',
                      context,
                    ),
                    CustomizableBTN(
                      'assets/google.png',
                      const Color(0xff4285F4),
                      'Will be added soon',
                      context,
                    ),
                    CustomizafbLogin(
                      'assets/fb.png',
                      const Color(0xff475993),
                      'SignUp With Facebook',
                      context,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          (MaterialPageRoute(
                            builder: (context) =>
                                LoginPage(userType: widget.userType),
                          )),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Text(
                          'Already have an Account? Sign In',
                          style: TextStyle(
                            color: Color(0xff6043F5),
                            fontWeight: FontWeight.w800,
                            fontSize: 10,
                          ),
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
            builder: (context) => SignUpPage(
              userType: widget.userType,
            ),
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
                  Text(
                    inputTxt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomizafbLogin(
    image,
    color,
    inputTxt,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {
        Navigator.push(
          context,
          (MaterialPageRoute(
            builder: (context) => FbLogin(userType: widget.userType),
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
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 15.0, top: 5, bottom: 5, left: 4.0),
                    child: Image.asset(image),
                  ),
                  Text(
                    inputTxt,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget CustomizableBTN(
    image,
    color,
    inputTxt,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () async {},
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        fontFamily: 'Roboto'),
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
