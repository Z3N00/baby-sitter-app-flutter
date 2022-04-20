// ignore: file_names
import 'package:flutter/material.dart';

  Widget customallBtn(color, inputTxt, BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   (MaterialPageRoute(
        //     builder: (context) => CreateAccount(),
        //   )),
        // );
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width *0.74429223,
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
                    style: const TextStyle(
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
