import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';

class Product_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductApiProvider(),
      child: Consumer<ProductApiProvider>(
        builder: (context, data, child) {
          data.ShowAllData();
          return LayoutBuilder(
            builder: (context, constraints) {
              return Scaffold(
                body: ListView.builder(
                  itemCount: data.product.length,
                  itemBuilder: (context,index) {
                    return Center(
                      child: Text("hello"),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
