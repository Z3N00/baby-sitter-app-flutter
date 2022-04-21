import 'package:babycare/screens/BookingStatus_card.dart';
import 'package:flutter/material.dart';

class BookingStatus extends StatefulWidget {
  const BookingStatus({Key? key}) : super(key: key);

  @override
  State<BookingStatus> createState() => _BookingStatusState();
}

class _BookingStatusState extends State<BookingStatus> {
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
                  itemCount:1,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 20.0,
                    crossAxisSpacing: 20.0,
                  ),
                  itemBuilder: (context, index) =>BookingStatusCard()
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

