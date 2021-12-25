import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

// import 'MyPages/ProductList.dart';
import 'MyPages/login_page.dart';
import 'Provider/MainProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]);
  runApp(
      ChangeNotifierProvider<MainProvider>(
          create: (_) => MainProvider(),
          child: MyApp()
      ));
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
      home: login_page(),
    );
  }
}