import 'package:babycare/screens/newNotification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SitterCart extends StatelessWidget {
  final GiftItem giftItem;
  const SitterCart({
    Key? key,
    required this.giftItem,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,

      child:Column(

        children: [
          if(giftItem.status.toString() == "Pending")...[
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
            Container(
              child:  Card(
            child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
     ListTile(
    leading: Icon(Icons.album),
    subtitle: Text(giftItem.email.toString()),
    title: Text(giftItem.name.toString()),
    ),
    Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: <Widget>[
      Text("Accepted")
    ],
    ),
    ],
    ),
    ),
            ),
          ]
        ],
      )


    );


    }
  }

