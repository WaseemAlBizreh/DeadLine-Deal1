import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Provider/MainProvider.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';

class Product_list extends StatefulWidget {
  @override
  State<Product_list> createState() => _Product_listState();
}

class _Product_listState extends State<Product_list> {
  List<ResProduct> product = [];
  Future<List<ResProduct>> fetch_list() async{
    var p = ProductApi();
    var data = await p.ShowAllData();
    return data;
  }

  @override
  void initState() {
    super.initState();
    fetch_list().then((value){
      product = value;
      print(product[0].name);
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MainProvider>(context , listen: false);
    data.set_product(product);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints) {
          return ListView.builder(
            itemCount: data.product.length,
            itemBuilder: (context, index) {
              return Container(

              );
            },
          );
        },
      ),
    );
  }
}
