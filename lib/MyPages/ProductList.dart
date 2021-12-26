import 'package:flutter/material.dart';
import 'package:waseem/Service/ProductApi.dart';

class Product_list extends StatefulWidget {
  @override
  State<Product_list> createState() => _Product_listState();
}

class _Product_listState extends State<Product_list> {
  Future fetch_list() async{
    var p = ProductApi();
    var data = await p.fetchAllData();
    print(data[0].name);
  }

  @override
  void initState() {
    super.initState();
    fetch_list();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: ElevatedButton(
        onPressed: fetch_list,
        child: Text("press"),
      ),
    );
  }
}
