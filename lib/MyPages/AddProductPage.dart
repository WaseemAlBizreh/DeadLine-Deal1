import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/ProductApi.dart';

import '../Variables.dart';

class AddProductPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var Devheight = MediaQuery.of(context).size.height;
    var Devwidth = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (_) => ProductApiProvider(),
        child: Consumer<ProductApiProvider>(builder: (context, addP, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: c1,
                title: Text("Add Your Product"),
              ),
              body: Container(
                color: c2,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Devheight * 0.31,
                      ),
                      Container(
                          height: Devheight * 0.66,
                          child: Card(
                        margin: EdgeInsets.fromLTRB(2, 5, 2, 5),
                        child: TextFormField(
                          //controller: addP.name,
                          //onFieldSubmitted: addP.setName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'please enter a product name';
                            }
                          },
                        )),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        }));
  }
}
