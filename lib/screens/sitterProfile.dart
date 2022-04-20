import 'package:flutter/material.dart';

class babysitterProfile extends StatefulWidget{
  @override
  State<babysitterProfile> createState() => _babysitterProfileState();
}

class _babysitterProfileState extends State<babysitterProfile> {
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
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child: Container(
                          height: 150,
                          width: 150,

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

                      SizedBox(
                        width: 30,
                      ),

                      Column(
                        children: const [
                          Text("Nikita Johns", style: TextStyle(
                              color: Color(0xff6043F5),
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),),
                          Text("Montreal, Quebec Canada")
                        ]
                      )

                    ]
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Column(
                    children: [
                      Padding(
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
                        child:  Card(
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
                        child: Text('Save'),
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