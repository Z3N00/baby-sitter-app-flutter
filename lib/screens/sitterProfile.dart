import 'package:babycare/screens/newNotification.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BabysitterProfile extends StatefulWidget{
  const BabysitterProfile({Key? key}) : super(key: key);

  @override
  State<BabysitterProfile> createState() => _BabysitterProfileState();
}


class _BabysitterProfileState extends State<BabysitterProfile> {
  final email =  FirebaseAuth.instance.currentUser!.email;
  String? _address="Montreal Quebec, Canada", _rph="35/h";
  final TextEditingController _nameController = TextEditingController(text: "abc");
  final TextEditingController _addressController = TextEditingController(text: "mo");
  final TextEditingController _rphController = TextEditingController(text: "Enter rate per hour");
  final TextEditingController _descriptionController = TextEditingController();

  String _name = "Niki Singh";

  bool _isEditable = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  updateData() async{
    FirebaseFirestore.instance
        .collection('Users')
        .doc('uid')
        .update(
        {
          'name':_name ,'address':_address, 'rph': _rph
        }).then((result){
      print("new USer true");
    }).catchError((onError){
      print("onError");
    });
  }



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(

                    child: const Text("Profile",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff6043F5),
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                    Container(

                      child: IconButton(
                        icon: const Icon(
                          Icons.edit,
                        ),
                        iconSize: 20,
                        color: Color(0xff6043F5),
                        onPressed: () {
                          setState((){
                            _isEditable = true;

                          });
                        },
                      ),
                    ),
                ]
                ),

                Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 20),
                      child: Container(
                        height: 120,
                        width: 120,

                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.0,

                          ),
                            image: const DecorationImage(
                              image: AssetImage("assets/niki.png"),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: null,

                      ),
                    ),

                    const SizedBox(
                      width: 30,
                    ),

                    Column(
                      children:  [
                        Row(
                          children:  [
                            Container(
                              width: 150,
                              child: !_isEditable
                              ? Text(_name)
                              :TextFormField(
                                controller: _nameController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0)
                                ),

                                textInputAction: TextInputAction.done,
                                 onFieldSubmitted: (value){
                                  setState(() => {_isEditable = false, _name=value});
                                 },

                                 style: const TextStyle(
                                  color: Color(0xff6043F5),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                              ),
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Container(
                            width: 150,
                            child: !_isEditable ?
                            Text("Montreal, Quebec Canada")
                            : TextFormField(
                              controller: _addressController,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                  contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0)
                              ),

                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){
                                setState(() => {_isEditable = false, _address=value});
                              },
                            )

                            ),

                          ],
                        )

                      ]
                    )

                  ]
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                    padding: const EdgeInsets.only(right: 250, bottom: 20),
                  child: !_isEditable ?
                  Text("35/h")
                      : TextFormField(
                    controller: _rphController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0)
                    ),

                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value){
                      setState(() => {_isEditable = false, _rph=value});
                    },
                  ),
                ),

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right:105),
                      child: Text("DESCRIPTION",
                        textAlign:TextAlign.left,
                        style: TextStyle(
                          color: Color(0xff6043F5),
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      ),
                      ),
                    ),

                    Container(
                      width: 300,
                      height: 100,
                      child:   Card(
                          color: Colors.white10,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextField(
                              controller: _descriptionController,
                              maxLines: 8,
                              decoration: InputDecoration.collapsed(hintText: "Write Something here..."),
                            ),
                          )
                      )
                    ),
                    ElevatedButton(

                      style: ButtonStyle(

                        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor: MaterialStateProperty.all<Color>(Color(0xff6043F5))

                      ),
                      onPressed: () {
                        GiftManager().update_user(_nameController.text, _rphController.text, email, _descriptionController.text, _addressController.text);
                      },
                      child: const Text('Save'),
                    )

                  ],
                )

              ]
            ),

            ),
          ),
        ),
      );

  }
}