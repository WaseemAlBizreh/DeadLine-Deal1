import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';


var c1 = const Color(0xFF06487f);
var c2 = const Color(0xFF86a9db);
var c3 = const Color(0xffdcdcf6);
var c4 = const Color(0xff345b8e);
var c5 = const Color(0xff5c97d5);

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
      height: double.infinity,
      width: double.infinity,
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
        const Text(
          "WELCOME TO OUR SHOP",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: ElevatedButton(
            child: Ink(
              padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(colors: [c1, c2]),
              ),
              child: Container(
                child: const Text(
                  'Log In',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              elevation: MaterialStateProperty.all(0),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            onPressed: () {},
          ),
        ),
        ElevatedButton(
          child: Ink(
            padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [c2, c1]),
            ),
            child: Container(
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
            elevation: MaterialStateProperty.all(0),
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: null,
        ),
      ]),
    ));
  }
}
