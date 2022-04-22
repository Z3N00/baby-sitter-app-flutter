import 'package:babycare/screens/parent_notification.dart';
import 'package:babycare/screens/newNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class NotificationStatus extends StatefulWidget {
  const NotificationStatus({Key? key}) : super(key: key);

  @override
  State<NotificationStatus> createState() => _NotificationStatusState();
}

class _NotificationStatusState extends State<NotificationStatus> {


  final email =  FirebaseAuth.instance.currentUser!.email;

  List<NotificationModel> notifications = [];


  @override
  void initState() {
    super.initState();

    fetchNotifications();

  }

  fetchNotifications() async {
    dynamic result = await GiftManager().checkNotification(this.email);
    if (result == null) {
      print("Notification list null");
    } else {
      setState(() {
        notifications = result;

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: new EdgeInsets.only(top: 10,bottom: 10),
        child: ListView.builder(
            itemCount: notifications.length,
            padding: const EdgeInsets.only(top: 10.0),
            itemBuilder: (context, index) {
              return NotificationStatusCard(notificationModel: notifications[index],);
            })
    );
  }
}

