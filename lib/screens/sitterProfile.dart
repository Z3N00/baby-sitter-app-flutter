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
  String? _name="Niki", _address="Montreal Quebec, Canada", _rph = "35/hr", _desc="Description..." ;
  final TextEditingController _nameController = TextEditingController(text: "Enter Name");
  final TextEditingController _addressController = TextEditingController(text: "Enter Address");
  final TextEditingController _rphController = TextEditingController(text: "Enter rate");
  final TextEditingController _descriptionController = TextEditingController();

  bool _isEditable = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;


 getData() async{
   FirebaseFirestore.instance
       .collection('users')
       .where("email", isEqualTo: email)
       .snapshots()
       .listen((data) =>

       data.docs.forEach((doc) => {

          _name = doc['name'],
         _address = doc['address'],
         _rph = doc['rate'],
         _desc = doc['description']
           }
       ));
 }
  @override
  void initState() {
    super.initState();
    getData();

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

                Column(
                  children:[
                    Padding(
                      padding: const EdgeInsets.only(left:20, top: 20),
                      child: Container(
                        height: 200,
                        width: 200,

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
                      height: 20,
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children:  [
                        Container(
                          padding: EdgeInsets.only(left: 40),
                          width: double.infinity,
                          child: !_isEditable
                          ? Text(_name!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xff6043F5),
                              fontSize: 40,
                              fontWeight: FontWeight.bold
                          ),)
                          :TextFormField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0)
                            ),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Color(0xff6043F5),
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),

                            textInputAction: TextInputAction.done,
                             onFieldSubmitted: (value){
                              setState(() => {_isEditable = false, _name=value});
                             },


                          ),
                          ),


                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                    padding: EdgeInsets.only(left: 40),
                    width: double.infinity,
                    child: !_isEditable ?
                    Text(_address.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)
                    : TextFormField(
                      controller: _addressController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 50, horizontal: 20)
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,

                      ),
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (value){
                        setState(() => {_isEditable = false, _address=value});
                      },
                    )

                    )

                  ]
                ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 20),
                  child: !_isEditable ?
                  Text("Rate: " + _rph.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )
                      : TextFormField(
                    controller: _rphController,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 0),

                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textInputAction: TextInputAction.done,
                    onFieldSubmitted: (value){
                      setState(() => {_isEditable = false, _rph=value});
                    },
                  ),
                ),

                Column(
                  children: [
                    // const Padding(
                    //   padding: EdgeInsets.only(right:105),
                    //   child: Text("DESCRIPTION",
                    //     textAlign:TextAlign.left,
                    //     style: TextStyle(
                    //       color: Color(0xff6043F5),
                    //       fontSize: 30,
                    //       fontWeight: FontWeight.bold
                    //   ),
                    //   ),
                    // ),

                    Container(
                      width: 300,
                      height: 100,
                      child:   Card(
                          color: Colors.white70,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: !_isEditable ?
                            Text(_desc.toString()) :
                            TextFormField(
                              controller: _descriptionController,
                              maxLines: 8,
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (value){
                                setState(() => {_isEditable = false, _desc=value});
                              },
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
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Profile Updated"),
                        ));
                        GiftManager().update_user(_nameController.text, _rphController.text, email, _descriptionController.text, _addressController.text);
                        _isEditable = false;
                      },
                      child: const Text('Update'),
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