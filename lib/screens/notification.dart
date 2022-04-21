

import 'package:babycare/screens/notification_cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'newNotification.dart';



class SitterNotification extends StatefulWidget {

  final String email;
  const SitterNotification({Key? key, required this.email}) : super(key: key);

  @override
  State<SitterNotification> createState() => _SitterNotificationState();
}

class _SitterNotificationState extends State<SitterNotification> {

  List<GiftItem> giftItems = [];


  @override
  void initState() {
    super.initState();

    fetchGiftData();

  }

  fetchGiftData() async {
    dynamic result = await GiftManager().getGiftItemList();
    if (result == null) {
      print("Gift list null");
    } else {
      setState(() {
        giftItems = result;
        // for(var i = 0; i< giftItems.length; i++){
        //
        //   giftItems.add(giftItems[i]);
        //
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Container(
        margin:  EdgeInsets.only(top: 10,bottom: 10),
        child: Column(

          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: giftItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      itemBuilder: (context, index) => SitterCart(
                    giftItem: giftItems[index],

                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
}
