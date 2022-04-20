import 'package:babycare/screens/newNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SitterCart extends StatelessWidget {
  const SitterCart({
    Key? key,
    required this.giftItem,
  }) : super(key: key);
  final GiftItem giftItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          if(giftItem.status.toString() == "Pending")...[
            new Card(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(giftItem.name.toString()),
                    subtitle: Text(giftItem.email.toString()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          GiftManager().update_data(giftItem.id.toString());
                        },
                        icon: Icon(
                          Icons.check_circle,
                          color: Colors.black.withOpacity(0.5),
                          size: 18,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.black.withOpacity(0.5),
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ]
          else...[
            Card(

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.album),
                    title: Text(giftItem.name.toString()),
                    subtitle: Text(giftItem.email.toString()),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      // IconButton(
                      //   onPressed: () {
                      //     GiftManager().update_data(giftItem.id.toString());
                      //   },
                      //   icon: Icon(
                      //     Icons.check_circle,
                      //     color: Colors.black.withOpacity(0.5),
                      //     size: 18,
                      //   ),
                      // ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(
                      //     Icons.cancel,
                      //     color: Colors.black.withOpacity(0.5),
                      //     size: 18,
                      //   ),
                      // ),
                      const SizedBox(width: 8),
                    ],
                  ),
                ],
              ),
            ),
          ]
        ],
      )


    );


    }
  }

