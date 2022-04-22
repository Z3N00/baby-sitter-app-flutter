import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class BabysitterProfile extends StatefulWidget{
  const BabysitterProfile({Key? key}) : super(key: key);

  @override
  State<BabysitterProfile> createState() => _BabysitterProfileState();
}


class _BabysitterProfileState extends State<BabysitterProfile> {
  String? _address, _rph;
  final TextEditingController _controller =
  TextEditingController(text: "Festive");

  String _name = "Niki Singh";
  bool _isEditable = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  fetchUser() async {
    final firebaseUser = await _auth.currentUser!;
    print("------------------------------");
    print(firebaseUser);
    //email = firebaseUser.email;
    _name = firebaseUser.displayName ?? "test";
    //phone = firebaseUser.phoneNumber as int? ?? 5148851994;
    _address = "test data";
    _rph = "35/h";
    print("-------------------------------");

  }

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
            child: Container(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 170),
                    child: Text("Profile",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff6043F5),
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),
                    ),
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
                                  initialValue: _name,
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
                              Container(

                                alignment: Alignment.center,
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
                            ],
                          ),
                          Row(
                            children: [
                              Text("Montreal, Quebec Canada"),
                              Container(

                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                  ),
                                  iconSize: 20,
                                  color: Colors.black,
                                  onPressed: () {},
                                ),
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
                      padding: EdgeInsets.only(right: 250),
                    child: Text("Rate per hour: ${_rph}"),
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
                        height: 250,
                        child:  const Card(
                            color: Colors.white10,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextField(
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
                        onPressed: () { },
                        child: const Text('Save'),
                      )

                    ],
                  )

                ]
              )
              ),

            ),
          ),
        ),
      );

  }
}