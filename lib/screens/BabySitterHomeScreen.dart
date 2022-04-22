import 'package:babycare/screens/notification.dart';
import 'package:babycare/screens/sitterProfile.dart' show BabysitterProfile;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;
const TextStyle optionStyle =
TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

List<Widget> _widgetOptions = <Widget>[

  SitterNotification(),
  BabysitterProfile(),
  // BabysitterProfile(),
];

class SitterHome extends StatefulWidget {
  const SitterHome({Key? key, required this.email}) : super(key: key);
  final String email;

  @override
  State<SitterHome> createState() => _SitterHomeState();
}

class _SitterHomeState extends State<SitterHome> {
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
     const TextStyle optionStyle =
    TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('Baby Sitter'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                print("Logout");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Logout"),
                ));
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.logout),
            ),
          ]),
      backgroundColor: const Color(0xff693EFF),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
             icon: Icon(Icons.account_circle_outlined),
            label: 'Profile',
            backgroundColor: Colors.green,
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,

      ),
    );
  }
}
