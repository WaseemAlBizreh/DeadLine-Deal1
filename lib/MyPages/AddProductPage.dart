import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:waseem/Provider/AddProductProvider.dart';

import '../Variables.dart';

class AddProductPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddProductProvider(),
        child: Consumer<AddProductProvider>(
            builder: (context, addP, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: c1,
                title: Text("Add Your Product"),
              ),
              body:Container(
                  decoration: BoxDecoration(
                    color: c2,
                  ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: constraints.maxHeight * 0.02,
                        ),
                        Container(
                          width: double.infinity,
                          height: constraints.maxHeight * 0.1,
                            child: Card(
                                //margin: EdgeInsets.all(),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                elevation: 75,
                                color: Colors.white,
                                child: Form(
                                  key: _formkey,
                                  child: Row(
                                      children: [
                                        Container(
                                          width: constraints.maxWidth*0.30,
                                      //margin: EdgeInsets.fromLTRB(),
                                      child: TextFormField(
                                        controller: addP.name,
                                        onFieldSubmitted: addP.setName,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter a product name';
                                          }
                                        },
                                      ),
                                    ),
                                        Container(
                                          color: c2,
                                          width: constraints.maxWidth*0.30,
                                      //margin: EdgeInsets.fromLTRB(),
                                      child: TextFormField(
                                        controller: addP.price,
                                        keyboardType: TextInputType.number,
                                        onFieldSubmitted: addP.setPrice,
                                        validator: (value) {
                                          var daprice = double.parse(value!);
                                          assert(value is double);
                                          if (value.isEmpty) {
                                            return 'please enter a product price';
                                          }
                                          if (daprice < 0) {
                                            return 'please enter a product positive price';
                                          }
                                        },
                                      ),
                                    ),
                                  ]),
                                )
                            ),
                        )
                      ],
                    ),
                ),
            );
          });
        }));
  }
}
