import 'package:babycare/screens/BookingStatus_card.dart';
import 'package:babycare/screens/newNotification.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  State<BookingStatus> createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {


  final email =  FirebaseAuth.instance.currentUser!.email;

  List<BookingModel> bookings = [];


  @override
  void initState() {
    super.initState();

    fetchGiftData();

  }

  fetchGiftData() async {
    dynamic result = await BookingDetails().getBookingList(this.email);
    if (result == null) {
      print("Gift list null");
    } else {
      setState(() {
        bookings = result;

      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.only(top: 10,bottom: 10),
      child: ListView.builder(
          itemCount: bookings.length,
          padding: const EdgeInsets.only(top: 10.0),
          itemBuilder: (context, index) {
            return BookingStatusCard(bookingModel: bookings[index],);
          })
      );
  }
}

