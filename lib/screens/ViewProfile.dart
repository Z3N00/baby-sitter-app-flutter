// import 'package:baby_sitter_app/screens/Reviews.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// import '../Dates/dates.dart';
// import '../screens ui/Availability.dart';
import '../screens ui/Reviews.dart';
import 'checkout.dart';
// import 'chooseServices.dart';
// import 'chooseServices.dart';

class ViewProf extends StatefulWidget {
  ViewProf({Key? key, required this.nameofSitter, required this.uniquekey,required this.parentKey })
      : super(key: key);
      String parentKey;
  String nameofSitter;
  String uniquekey;

  @override
  State<ViewProf> createState() => _ViewProfState();
}

class _ViewProfState extends State<ViewProf> {
  late DateTime date;
  String BabySitterdescrip = 'Hello am a baby sitter';
  final database = FirebaseDatabase.instance.ref;
  String photourl = '';
  bool isfavourite = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // activateListeners(context);
    // nameUpdate(context);
    // getdetails(context);
    nameUpdate(context);
  }

  void nameUpdate(BuildContext context) {
    database
        .call('Dummyinputskeys/${widget.uniquekey}/Description/description')
        .onValue
        .listen((event) {
      final Object? NameofSitter = event.snapshot.value;
      setState(() {
        BabySitterdescrip = '$NameofSitter';
      });
    });
  }

  // void activateListeners(BuildContext context) {
  //   database
  //       .call('Sitter Details/SitterPhofilePhotoUrl')
  //       .onValue
  //       .listen((event) {
  //     final Object? NameofSitter = event.snapshot.value;
  //     setState(() {
  //       photourl = '$NameofSitter';
  //       print("this is photo path" + photourl);
  //     });
  //   });
  // }
  String name = 'name';

  //  final contactinfo = FirebaseDatabase.instance
  //     .ref()
  //     .child('Dummyinputskeys')
  //     .orderByChild('name');
  String getTxt() {
    if (date == null) {
      return 'select Date';
    } else {
      return '${date.month}//${date.day}//${date.year}';
    }
  }

  Future pickDate(BuildContext context) async {
    final intialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: intialDate,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (newDate == null) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final Babysitter_description = database.call('Sitter Details');

    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/babysitter.png')),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Positioned(
                              top: 20,
                              left: 20,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 150, bottom: 00.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  // color: Colors.red,
                                  margin: EdgeInsets.only(top: 20, left: 20),
                                  // width: 324,
                                  // height: 228,
                                  // child: Image.network(
                                  //   photourl,
                                  //   width: 324,
                                  //   height: 228,
                                  // ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // Image.asset('assets/niki.png'),
                                        Container(
                                          width: 100,
                                          height: 140,
                                          decoration: BoxDecoration(
                                            color: Color(0xff6043F5),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.person,
                                              color: Colors.white,
                                              size: 60,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          widget.nameofSitter,
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff6043F5),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              'DESCRIPTION',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff6043F5),
                              ),
                            ),
                            Text(
                              // BabySitterdescrip),//Getting the descrition of the user from the database
                              BabySitterdescrip,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10.0, right: 10),
                              child: Divider(
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left:
                                      MediaQuery.of(context).size.width - 100),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ReviewsComments()),
                                  );
                                },
                                child: Text(
                                  'View All',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                            Text(
                              'REVIEWS',
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(0xff6043F5),
                              ),
                            ),
                            reviewListTile(
                                'He has watched my two children (ages 4 and 7) twice a week for the entire summer, and they were a joy to work ....',
                                'Phill Wilson'),
                            reviewListTile(
                                'He has watched my two children (ages 4 and 7) twice a week for the entire summer, and they were a joy to work ....',
                                'Phill Wilson'),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 00,
                      right: 10,
                      child: FloatingActionButton(
                        backgroundColor: Colors.white60,
                        onPressed: () {
                          setState(() {
                            isfavourite = !isfavourite;
                          });
                        },
                        child: !isfavourite
                            ? Icon(
                                Icons.favorite_border_outlined,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Color(0xff693EFF),
                              ),
                      ),
                      // ElevatedButton(
                      //   child: Text('Check Availability'),
                      //   onPressed: () {
                      //     pickDate(context);
                      //     Navigator.push(
                      //       context,
                      //       (MaterialPageRoute(
                      //         builder: (context) => AvailabilityPage(),
                      //       )),
                      //     );
                      //   },
                      // ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 2.0),
                        child: SizedBox(
                          width: 329,
                          height: 52.34,
                          child: ElevatedButton(
                            onPressed: () {
                              getdetails(context);
                              Navigator.push(
                                context,
                                (MaterialPageRoute(
                                  builder: (context) => CheckoutPage(
                                    ParentKey: widget.parentKey,
                                    name: widget.nameofSitter,
                                    uniquekeys: widget.uniquekey,
                                  ),
                                  // builder: (context) => ServicesChoosen(),
                                )),
                              );
                            },
                            child: Text(
                              'Check Availability',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final databasenew = FirebaseDatabase.instance.ref().child('Dummyinputskeys');
  getdetails(BuildContext context) async {
    DataSnapshot snapshot =
        await databasenew.child(widget.nameofSitter).once() as DataSnapshot;
    Map contact = Map<String, dynamic>.from(snapshot.value as Map);
    name = contact['name'];
    print(1);
  }

  Widget reviewListTile(message, name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          backgroundImage: ExactAssetImage('assets/wilson.png'),
        ),
        title: Text(
          name,
          style: TextStyle(
            color: Color(0xff6043F5),
          ),
        ),
        subtitle: Text(message),
      ),
    );
  }
}
