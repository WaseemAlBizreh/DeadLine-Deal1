import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/ProductApi.dart';

import '../Variables.dart';

class ShowProduct extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApiProvider>(
        builder: (context,data,child){
          return LayoutBuilder(
              builder: (context,constraints){
                return Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: c3,
                  ),
                );
              }
          );
        }
    );
  }
}