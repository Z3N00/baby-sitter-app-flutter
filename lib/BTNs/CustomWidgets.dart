import 'package:flutter/material.dart';

class CustomWidgetContainer extends StatelessWidget {
   CustomWidgetContainer({Key? key, required this.Height, required this.bottomleftRadius,required this.topleftRadius}) : super(key: key);
  double Height;
  double bottomleftRadius;
  double topleftRadius;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: Height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(bottomleftRadius),
          topLeft: Radius.circular(topleftRadius),
        ),
        gradient: LinearGradient(
            colors: [
              // Colors.black,
              Color(0xff6043F5),
              Color(0xff6043F5),
            ],
            stops: [
              0.0,
              0.5,
              // 1.0
            ],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated),
      ),
    );
  }
}
