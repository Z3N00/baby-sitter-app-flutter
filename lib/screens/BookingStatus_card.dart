import 'package:flutter/material.dart';

import 'newNotification.dart';

class BookingStatusCard extends StatefulWidget {
  final BookingModel bookingModel;
  const BookingStatusCard({Key? key, required this.bookingModel}) : super(key: key);

  @override
  State<BookingStatusCard> createState() => _BookingStatusCardState();
}

class _BookingStatusCardState extends State<BookingStatusCard> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Card(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(widget.bookingModel.sitterId.toString()),
                subtitle: Text(widget.bookingModel.status.toString()),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
