import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'u_register.dart';
import 'home_page.dart';
// import 'package:get/get.dart';
// import 'package:waseem/home.dart';

void main() {
  runApp(Splash_Screen());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      debugShowCheckedModeBanner: false,
      home: Register(),
    );
  }
}

