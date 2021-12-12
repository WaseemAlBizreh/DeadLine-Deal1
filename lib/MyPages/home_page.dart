import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'login_page.dart';

var c1 = const Color(0xFF06487f);
var c2 = const Color(0xFF86a9db);
var c3 = const Color(0xffdcdcf6);
var c4 = const Color(0xff345b8e);
var c5 = const Color(0xff5c97d5);

void selectScreen(BuildContext cntxt, bool scrn) {
  Navigator.of(cntxt).pushReplacement(MaterialPageRoute(builder: (_) {
    if (scrn == false) {
      return login_page();
    } else {
      return Register();
    }
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
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/imgs/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 100,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75.0),
                  gradient: LinearGradient(
                      colors: [
                        Color(0xffB6DCEF),
                        Color(0xff3091D5),
                        Color(0xff265B7B)]),
                ),
                child: const CircleAvatar(
                  radius: 90.0,
                  backgroundImage: AssetImage('assets/imgs/logo_transparent_mid.png'),
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: 100,),
              Card(
                elevation: 75,
                color: Colors.white.withOpacity(0.4),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(70,30,70,10),
                        child: ElevatedButton(
                          child: Ink(
                            padding:  EdgeInsets.fromLTRB(100, 15, 100, 15),
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
                            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            return selectScreen(context, false);},
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0,0,0,30),
                        child: ElevatedButton(
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
                              )
                          ),
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                            elevation: MaterialStateProperty.all(10),
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                          ),
                          onPressed: () {
                            return selectScreen(context, true);},
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        )
    );
  }
}
