import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'MyPages/ProductList.dart';
import 'MyPages/login_page.dart';
import 'Service/ProductApi.dart';
import 'Variables.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(ChangeNotifierProvider(
      create: (_) => ProductApiProvider(), child: MyApp()));
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
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(bodyColor: c1),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        title: 'Deadline Deals',
        debugShowCheckedModeBanner: false,
        home: login_page());
  }
}
