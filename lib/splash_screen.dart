import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
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
      home: SplashScreenView(
        navigateRoute: Register(),
        duration: 2000,
        imageSize: 130,
        imageSrc: "assets/imgs/1.png",
        backgroundColor: c3,
      ),
    );
  }
}
