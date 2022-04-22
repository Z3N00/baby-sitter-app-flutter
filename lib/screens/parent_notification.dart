import 'package:babycare/screens/newNotification.dart';
import 'package:flutter/material.dart';


class NotificationStatusCard extends StatefulWidget {
  final NotificationModel notificationModel;

  const NotificationStatusCard({Key? key, required this.notificationModel})
      : super(key: key);



  @override
  State<NotificationStatusCard> createState() => _NotificationStatusCardState();
}

class _NotificationStatusCardState extends State<NotificationStatusCard> {
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
                Expanded(
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: ListTile(
                            title: Text(widget.notificationModel.message.toString()),
                          ),
                        ),
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
