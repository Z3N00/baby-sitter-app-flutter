import 'package:babycare/screens/confirmBooking.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: buildAppBar(context),
      body: Container(
        margin: new EdgeInsets.only(top: 10,bottom: 10),
        child:Column(
          children: [
            MyStatelessWidget(txt1: "Baby Shower",txt2: "20",),
            MyStatelessWidget(txt1:"Baby Cloth laundry",txt2: "15"),

          ],
        ),
      ),
      bottomNavigationBar: Container(
        child:  TextButton(style: TextButton.styleFrom(
          primary: Colors.blueAccent,
          padding: const EdgeInsets.all(16.0),
          textStyle: const TextStyle(fontSize: 20),
        ),onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context) =>ConfirmBooking(), ),);
        }, child: Text("Order"),),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Cart",
            style: TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
class MyStatelessWidget extends StatelessWidget {
  final String txt1;
  final String txt2;
   MyStatelessWidget({Key? key ,required this.txt1,required this.txt2});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(

        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           ListTile(
            leading: Icon(Icons.album),
            title: Text(txt1),
            // subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
             Text("\$${txt2}"),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    );
  }
}