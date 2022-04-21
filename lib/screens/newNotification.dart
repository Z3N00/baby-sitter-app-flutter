import 'package:cloud_firestore/cloud_firestore.dart';

class GiftItem {
  String? name, email;
  String? price;
  String? id;
  String? status;

  GiftItem({this.name, this.price, this.email, this.id, this.status});
}

class GiftManager {
  List<GiftItem> giftItems = [];

  Future getGiftItemList() async {
    final CollectionReference gifts =
    FirebaseFirestore.instance.collection('booking');
    try {
      giftItems.clear();
      var snapshot = await gifts.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null && data['sitterId'] == "pant@grr.la") {
          var booking = GiftItem();
          booking.name = data['name'];
          booking.price = data['totalAmount'];
          booking.email = data['email'];
          booking.id = data['id'];
          booking.status = data['status'];
          booking.id = element.id;

          giftItems.add(booking);
        } else {
          print("error:");
        }
      });
      return giftItems;
    } catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }


  // Future<void> update(String id) async {
  //
  // return FirebaseFirestore.instance.collection('booking').document(id).updateData(data);
  // }

  Future update_data(id) async {
    var getcollection = FirebaseFirestore.instance.collection('booking');
    getcollection.doc(id).update({"status": 'Confirmed'});
    return true;
  }


  Future create_booking(parent_email, emailofSitter, parent_name) async {

    FirebaseFirestore.instance.collection('booking').add(
        {
          "status": "Pending",
          "sitterId": emailofSitter,
          "name": parent_name,
          "email": parent_email,
          "totalAmount": "25"

        }).then((value){
      print(value);
    });

  }

}

class BookingModel{
  String? sitterId,status;
BookingModel({this.sitterId,this.status});

}

class BookingDetails{
  List<BookingModel> bookings = [];

  Future getBookingList() async {
    final CollectionReference gifts =
    FirebaseFirestore.instance.collection('booking');
    try {
      bookings.clear();
      var snapshot = await gifts.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null && data['sitterId'] == "pant@grr.la") {
          var booking = BookingModel();
          booking.sitterId = data['sitterId'];
          booking.status = data['status'];
          bookings.add(booking);
        } else {
          print("error:");
        }
      });
      return bookings;
    } catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }
}