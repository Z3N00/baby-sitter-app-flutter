import 'package:babycare/screens/BookingStatus_card.dart';
import 'package:babycare/screens/newNotification.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  State<BookingStatus> createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {



  List<BookingModel> bookings = [];


  @override
  void initState() {
    super.initState();

    fetchGiftData();

  }

  fetchGiftData() async {
    dynamic result = await BookingDetails().getBookingList();
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
      child:Column(
        children: [
          ListView(
            padding: EdgeInsets.all(8),
            shrinkWrap: true,
            // physics: NeverScrollableScrollPhysics(),
            children: [
              Container(
                // margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount:bookings.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) =>BookingStatusCard(bookingModel: bookings[index],),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

