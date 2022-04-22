

import 'package:babycare/screens/notification_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'newNotification.dart';



class SitterNotification extends StatefulWidget {
   SitterNotification({Key? key}) : super(key: key);
  @override
  State<SitterNotification> createState() => _SitterNotificationState();
}

class _SitterNotificationState extends State<SitterNotification> {

  List<GiftItem> giftItems = [];

  final email =  FirebaseAuth.instance.currentUser!.email;

  @override
  void initState() {
    super.initState();

    fetchGiftData();

  }

  fetchGiftData() async {
    print(this.email);

    dynamic result = await GiftManager().getGiftItemList(this.email);
    if (result == null) {
      print("Gift list null");
    } else {
      setState(() {
        giftItems = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:Container(
          margin: new EdgeInsets.only(top: 10,bottom: 10),
          child: ListView.builder(
              itemCount: giftItems.length,
              padding: const EdgeInsets.only(top: 10.0),
              itemBuilder: (context, index) {
                return SitterCart(giftItem: giftItems[index],);
              })
      ),
    );
  }
}
