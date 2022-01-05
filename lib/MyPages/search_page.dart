import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:waseem/Variables.dart';

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductApiProvider>(
      create: (_) => ProductApiProvider(),
    child: Consumer<ProductApiProvider>(builder: (context, log, child){
      return LayoutBuilder(
        builder: (context, constraints){
          return Scaffold(
         body: Stack(
           children :[
           Column(
             children: [
               Container(
                 color: c1,
                 height: constraints.maxHeight * 0.3,
                 width: double.infinity ,
                 child: TextFormField(
                 ),
                ),
               Container(
                 height: constraints.maxHeight * 0.7,
                 width: double.infinity ,
                 color: c3,
                 child: ListView.builder(
                     itemBuilder: (){}
                 ),
               )
             ],
           ),
          ],
         ),
         );
        }
       );
      }
     )
    );
  }
}
