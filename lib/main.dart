import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Provider/MainProvider.dart';
// import 'package:intl/intl.dart';
//import 'package:image_picker/image_picker.dart'

import 'MyPages/ProductList.dart';
import 'MyPages/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);
  runApp(MyApp());
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
      title: 'Deadline Deals',
      debugShowCheckedModeBanner: false,
      home: Product_list(),
    );
  }
}