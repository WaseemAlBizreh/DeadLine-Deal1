import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:waseem/main.dart';

var c3 = const Color(0xffdcdcf6);
var c5 = const Color(0xff5c97d5);

class Splash_Screen extends StatefulWidget {
  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          backgroundColor: c3,
          //to put image dir here => image: Image.asset(''),
          //to edit photo size here => photoSize: 150,
          seconds: 3,
          title: const Text("Welcome To Our Shop"),
          loaderColor: c5,
          loadingText: const Text("Getting Things Ready For You"),
          navigateAfterSeconds: Register(),
        ),
      ),
    );
  }
}
