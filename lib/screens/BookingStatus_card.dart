import 'package:flutter/material.dart';

class BookingStatusCard extends StatefulWidget {
  const BookingStatusCard({Key? key}) : super(key: key);

  @override
  State<BookingStatusCard> createState() => _BookingStatusCardState();
}

class _BookingStatusCardState extends State<BookingStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.album),
                title: Text(""),
                subtitle: Text(""),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      // GiftManager().update_data(giftItem.id.toString());
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
      ],
    );
  }
}
