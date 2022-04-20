
import 'package:cloud_firestore/cloud_firestore.dart';

class GiftItem {
  String? name, email;
  String? price;
  String? id;
  String? status;
  GiftItem({this.name, this.price, this.email,this.id,this.status});
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
        if (data != null && data['sitterId'] == "pant@grr.la" ) {
          print(element.id);
          print(data);
          print("Data name : ${data['name']}  ");
          // print("Data name : ${data['name']}  ${data} ");
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
    // var product_json = product_data.toJson();
    // print(product_json);

    var getcollection = FirebaseFirestore.instance.collection('booking');
    // var product = await getcollection.doc(product_data['id']).get();
    // Map<String, dynamic>? data = product.data();
    // print(data)
    // var products = data["products"];
    // for (var i = 0; i < products.length; i++) {
    //   if (products[i]['rank'] == product_data.id) {
    //     products[i] = product_json;
    //   }
    // }
    print(id);
    getcollection.doc(id).update({"status": 'Confirmed'});
    return true;
  }

}