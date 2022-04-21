// import 'package:baby_sitter_app/screens/Reviews.dart';

import 'package:babycare/screens/calendary.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'calender_select.dart';

// import '../Dates/dates.dart';
// import '../screens ui/Availability.dart';

// import 'chooseServices.dart';
// import 'chooseServices.dart';

class ViewProf extends StatefulWidget {
  ViewProf({Key? key, required this.nameofSitter,required this.parentEmail, required this.emailofSitter})
      : super(key: key);
  String emailofSitter;
  String nameofSitter;
  String parentEmail;

  @override
  State<ViewProf> createState() => _ViewProfState();
}

List<String> views = <String>['Month', 'Year', 'Decade', 'Century'];

class _ViewProfState extends State<ViewProf> {
  late DateTime date;

  String photourl = '';
  bool isfavourite = false;

  String name = 'name';

  @override
  Widget build(BuildContext context) {
    print(widget.nameofSitter);
    print(widget.emailofSitter);
    print(widget.parentEmail);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.35331325,
              width: MediaQuery.of(context).size.width,
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Image.asset('assets/babysitter.png'))),
          Transform.translate(
            offset: const Offset(0, -15),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  //first element of column

                  Row(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -25),
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset('assets/niki.png')),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            widget.nameofSitter,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff6043F5),
                              fontFamily: 'Roboto',
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                                size: 10,
                              ),
                              Text(
                                '4.7 Reviews (56)',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Montreal Quebec',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),

                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0, bottom: 2.0),
                        child: Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff6043F5),
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    // ignore: prefer_const_constructors
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8.0),
                      // ignore: prefer_const_constructors
                      child: Text(
                        'It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                          fontFamily: 'Roboto',
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, bottom: 2.0),
                    child: Row(
                      children: const [
                        Text(
                          'Reviews',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff6043F5),
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'View All',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // const SingleReview(),
                  const SingleReview(),
                  const SingleReview()
                ],
              ),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: SizedBox(
                      width: 329,
                      height: 52.34,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            (MaterialPageRoute(
                              builder: (context) =>new  DateRanges(emailofSitter:widget.emailofSitter,parentEmail:widget.parentEmail,nameofSitter: widget.nameofSitter),
                            )),
                          );
                        },
                        child: const Text(
                          'Check Availability',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  )))
        ],
      ),
    );
  }
}

class SingleReview extends StatelessWidget {
  const SingleReview({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundImage: ExactAssetImage('assets/wilson.png'),
      ),
      title: Text(
        'Phill Wilson',
        style: TextStyle(
          color: Color(0xff6043F5),
        ),
      ),
      subtitle: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          'It was popularised in the 1960s with the release of Letraset \nsheets containing Lorem Ipsum passages, and \nmore recently with desktop publishing \nsoftware like Aldus PageMaker including versions of Lorem Ipsum.',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
