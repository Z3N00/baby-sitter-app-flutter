import 'package:baby_sitter_app/screens/checkout.dart';
import 'package:flutter/material.dart';

var payprice = 12.70;

class ServicesChoosen extends StatefulWidget {
  const ServicesChoosen({Key? key}) : super(key: key);

  @override
  State<ServicesChoosen> createState() => _ServicesChoosenState();
}

class _ServicesChoosenState extends State<ServicesChoosen> {
  @override
  Widget build(BuildContext context) {
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10, right: 150, bottom: 00.0),
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Image.asset(
                                'assets/niki.png',
                                width: 200,
                                height: 150,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 100.0),
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ServicePriceTage(),
                                  ServicePriceTage(),
                                  ServicePriceTage(),
                                  // ServicePriceTage(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Servicecalculator(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Servicecalculator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff6043F5),
        ),
        child: InkWell(
          onTap: () {
            // commented out for debugging process.



            // Navigator.push(
            //   context,
            //   (MaterialPageRoute(
            //     builder: (context) => CheckoutPage(),
            //   )),
            // );





          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '2',
                      style: TextStyle(fontSize: 20, color: Colors.pink),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     ' $payprice',
                  //     style: TextStyle(fontSize: 20, color: Colors.purple),
                  //   ),
                  // ),
                ],
              ),
              Text(
                'Proceed',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.pink,
                ),
              ),
              Text(
                'price',
                style: TextStyle(fontSize: 20, color: Colors.pink),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ServicePriceTage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width - 40,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffF6F6F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Baby Bath',
                    style: TextStyle(fontSize: 20, color: Colors.pink),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ' $payprice',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              backgroundColor: Colors.purple,
              elevation: 0,
              onPressed: () {},
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
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
