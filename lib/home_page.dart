import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'u_register.dart';

var c1 = const Color(0xFF06487f);

void selectScreen(BuildContext cntxt) {
  Navigator.of(cntxt).pushReplacement(MaterialPageRoute(builder: (_) {
    return Register();
  }));
}

class home_page extends StatefulWidget {
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: double.infinity,
        //child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: c1,
              padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {},
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: c1,
              padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            child: const Text(
              'Register',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onPressed: () {},
          ),
        ])
      ),
      //),
    );
  }
}
