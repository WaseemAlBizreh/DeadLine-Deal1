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
    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                color: c3,
              ),
            ),
          );
        });
  }
}
