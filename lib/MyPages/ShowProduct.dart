import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';

import '../Variables.dart';

class ShowProduct extends StatelessWidget {
  late final ResProduct product;

  ShowProduct({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: c3,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: c1,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: c1,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: c3,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: constraints.maxHeight * 0.3,
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.network(
                            product.image,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      alignment:Alignment.topCenter,
                    ),
                    Container(
                      margin:
                      EdgeInsets.only(top: constraints.maxHeight * 0.3),
                      height: constraints.maxHeight * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
