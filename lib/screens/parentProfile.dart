

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ParentProfile extends StatefulWidget {
  const ParentProfile({Key? key}) : super(key: key);

  @override
  State<ParentProfile> createState() => _ParentProfileState();
}
final FirebaseAuth _auth = FirebaseAuth.instance;
class _ParentProfileState extends State<ParentProfile> {
  String? uname ,email,address;
  int? phone;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  fetchUser() async {
    final firebaseUser = await _auth.currentUser!;
    print("------------------------------");
    print(firebaseUser);
    email = firebaseUser.email;
    uname = firebaseUser.displayName ?? "test";
    phone = firebaseUser.phoneNumber as int? ?? 5148851994;
    address = "test data";
    print("-------------------------------");

  }

  updateData() async{
    FirebaseFirestore.instance
        .collection('Users')
        .doc('uid')
        .update(
        {
      'name':uname ,'address':address,'phone':phone,
    }).then((result){
      print("new USer true");
    }).catchError((onError){
      print("onError");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        height: double.infinity,

        child: Column(
            children:  [
              const Padding(
                padding: EdgeInsets.only(top: 20, right: 250),
                child: Text("Profile",
                  textAlign: TextAlign.left,

                  style: TextStyle(
                      color: Color(0xff6043F5),
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Container(
                  height: 150,
                  width: 150,

                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.0,

                      ),
                      image: const DecorationImage(
                        image: AssetImage("assets/smith jones.png"),
                        fit: BoxFit.fill,
                      ),
                      borderRadius: BorderRadius.circular(30)
                  ),

                  child: null,

                ),
              ),
              const SizedBox(
                height: 40,
              ),
      FutureBuilder(
        future: fetchUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
                  return Text("Loading data");
                }
          else {
                  print(uname);
                  print("------------------------");
                 return Text("");
                }
              },
      ),

              TextWidget(name: "Name", color: Colors.grey),
              TextWidget(name: uname.toString(), color: Color(0xff6043F5)),
              SizedBox(
                height: 20,
              ),
              TextWidget(name: "E-mail", color: Colors.grey),
              TextWidget(name: email.toString(), color: Color(0xff6043F5)),
              SizedBox(
                height: 20,
              ),
              TextWidget(name: "Address", color: Colors.grey),
              TextWidget(name: address.toString(), color: Color(0xff6043F5)),
              SizedBox(
                height: 20,
              ),
              TextWidget(name: "Phone No.", color: Colors.grey),
              TextWidget(name: phone.toString(), color: Color(0xff6043F5)),
            ],
        ),
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  final String name;
  final Color color;
  TextWidget({Key? key ,required this.name,required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(name,

      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

