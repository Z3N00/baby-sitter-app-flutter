import 'package:flutter/material.dart';

import 'newNotification.dart';

class BookingStatusCard extends StatefulWidget {
  final BookingModel bookingModel;

  const BookingStatusCard({Key? key, required this.bookingModel})
      : super(key: key);

  @override
  State<BookingStatusCard> createState() => _BookingStatusCardState();
}

class _BookingStatusCardState extends State<BookingStatusCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Card(
          child: Container(
            height: 100,
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
                            title: Text(widget.bookingModel.sitterId.toString()),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                child: Text(widget.bookingModel.status.toString()),
                                onPressed: () {},
                              ),
                              SizedBox(
                                width: 8,
                              ),
                            ],
                          ),
                        )
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
    );
  }
}
