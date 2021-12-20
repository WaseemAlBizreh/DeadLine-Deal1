import 'package:flutter/material.dart';
//import 'package:http/http.dart';


class ProductList extends StatefulWidget {

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints) => ListView(
          children: [
            Card(

            ),
          ],
        ),
      ),
    );
  }
}
