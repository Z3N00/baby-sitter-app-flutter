import 'package:babycare/screens/newNotification.dart';
import 'package:flutter/material.dart';

class SitterCart extends StatefulWidget {
  final GiftItem giftItem;
  const SitterCart({
    Key? key,
    required this.giftItem,
  }) : super(key: key);

  @override
  State<SitterCart> createState() => _SitterCartState();
}

class _SitterCartState extends State<SitterCart> {

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      // flex: 2,
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(widget.giftItem.status.toString() == "Pending")...[
            Container(
              child: Card(
                child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Expanded(
                            child: Image.asset("assets/niki.png"),
                            flex: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Email:${widget.giftItem.email.toString()}"),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Name : ${widget.giftItem.name.toString()}"),
                                ),
                              ),
                              Expanded(
                                  flex: 5,
                                  child: Row(
                                children: [
                                IconButton(
                                            onPressed: () {
                                              GiftManager().update_data(widget.giftItem.id.toString());

                                            },
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.black.withOpacity(0.5),
                                              size: 18,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              GiftManager().reject_data(widget.giftItem.id.toString());
                                            },
                                            icon: Icon(
                                              Icons.cancel,
                                              color: Colors.black.withOpacity(0.5),
                                              size: 18,
                                            ),
                                          ),
                                ],
                              ))
                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
              ),
            ),

          ]
          else...[
            Container(
              child: Card(
                child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Expanded(
                            child: Image.asset("assets/niki.png"),
                            flex: 2,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Email: ${widget.giftItem.email.toString()}"),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Name: ${widget.giftItem.name.toString()}"),
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: ListTile(
                                  title: Text("Status: ${widget.giftItem.status.toString()}"),
                                ),
                              ),
                              SizedBox(height: 10,),

                            ],
                          ),
                        ),
                        flex: 8,
                      ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
              ),
            ),
          ]
        ],
      )


    );


    }
}

