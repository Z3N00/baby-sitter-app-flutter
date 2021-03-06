import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/notification.dart';

class GiftItem {
  String? name, email,sitteremail;
  String? price;
  String? id;
  String? status;

  GiftItem({this.name, this.price, this.email, this.id, this.status,this.sitteremail});
}

class GiftManager {
  List<GiftItem> giftItems = [];

  Future getGiftItemList(email) async {
    print(email);
    final CollectionReference gifts =
        FirebaseFirestore.instance.collection('booking');
    try {
      giftItems.clear();
      var snapshot = await gifts.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null && data['sitterId'] == email) {
          var booking = GiftItem();
          booking.name = data['name'];
          booking.price = data['totalAmount'];
          booking.email = data['email'];
          booking.id = data['id'];
          booking.status = data['status'];
          booking.id = element.id;
          booking.sitteremail = data['sitterId'];

          giftItems.add(booking);
        } else {
          print("error:");
        }
      });
      print(giftItems);
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

  Future update_data(id,email,sitter_id) async {
    var getcollection = FirebaseFirestore.instance.collection('booking');
    getcollection.doc(id).update({"status": 'Confirmed'});
    print(email);
    print(sitter_id);

    FirebaseFirestore.instance.collection('notifications').add({
      "email": email,
      "message": "Your Request of Booking has been accepted by $sitter_id ",
      "name": "",
    }).then((value) {
      print(value);
    });

    return true;
  }

  Future reject_data(id,email,sitter_id) async {
    var getcollection = FirebaseFirestore.instance.collection('booking');
    getcollection.doc(id).update({"status": 'Rejected'});
    FirebaseFirestore.instance.collection('notifications').add({
      "email": email,
      "message": "Your Request of Booking has been rejected by $sitter_id",
      "name": "",
    }).then((value) {
      print(value);
    });

    return true;
  }
  // List <String> get_blackout_dates(emailofSitter) async {
  //   List <String> dates_ = [];
  //   final CollectionReference users =
  //       FirebaseFirestore.instance.collection('users');
  //   var snapshot = await users.get();
  //   snapshot.docs.forEach((element) {
  //     Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
  //     if (data != null && data['email'] == emailofSitter) {
  //       dates_ =  data["blackout"];
  //       return dates_;
  //     }
  //   });
  // }

  Future checkNotification(email) async {
    List<NotificationModel> Notifications = [];
    final CollectionReference users =
    FirebaseFirestore.instance.collection('notifications');
    var snapshot = await users.get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
      if (data != null && data['email'] == email) {
        var notify = NotificationModel();
        notify.name = data['name'];
        notify.email = data['email'];
        notify.message = data['message'];
        print(data["message"]);
        Notifications.add(notify);
      }

    });
    return Notifications;

  }


  Future update_user(name, rate, email, desc,address) async {
    print(name);
    print(rate);
    print(email);
    print(desc);
    print(address);



    final CollectionReference users =
    FirebaseFirestore.instance.collection('users');
    var snapshot = await users.get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
      if (data != null && data['email'] == email) {
        users.doc(element.id).update({"rate": rate,"name":name,"address":address,"description":desc});
      }
    });}

  Future create_booking(parent_email, emailofSitter, parent_name, dates) async {
    final CollectionReference users =
        FirebaseFirestore.instance.collection('users');
    var snapshot = await users.get();
    snapshot.docs.forEach((element) {
      Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
      if (data != null && data['email'] == emailofSitter) {
        users.doc(element.id).update({"blackout": dates});
      }
    });





    FirebaseFirestore.instance.collection('booking').add({
      "status": "Pending",
      "sitterId": emailofSitter,
      "name": parent_name,
      "email": parent_email,
      "totalAmount": "25"
    }).then((value) {
      print(value);
    });
  }


}

class BookingModel {
  String? sitterId, status;

  BookingModel({this.sitterId, this.status});
}


class NotificationModel {
  String? email, name,message;

  NotificationModel({this.name, this.email,this.message});
}



class BookingDetails {
  List<BookingModel> bookings = [];

  Future getBookingList(email) async {
    final CollectionReference gifts =
        FirebaseFirestore.instance.collection('booking');
    try {
      bookings.clear();
      var snapshot = await gifts.get();
      snapshot.docs.forEach((element) {
        Map<String, dynamic>? data = element.data() as Map<String, dynamic>?;
        if (data != null && data['email'] == email) {
          var booking = BookingModel();
          booking.sitterId = data['sitterId'];
          booking.status = data['status'];
          bookings.add(booking);
        } else {
          print("error:");
        }
      });

      print(bookings);
      return bookings;
    } catch (e) {
      print("Error : ${e.toString()}");
      return [];
    }
  }
}
