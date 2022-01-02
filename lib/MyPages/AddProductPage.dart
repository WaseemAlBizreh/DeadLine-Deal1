import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
                  body: Container(
                    decoration: BoxDecoration(
                      color: c2,
                    ),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: TextFormField(
                              controller: addP.name,
                              onFieldSubmitted: addP.setName,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a product name';
                                }
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Product Name",
                                prefixIcon: Icon(Icons.shopping_cart, color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ), //product name
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: TextFormField(
                              controller: addP.price,
                              onFieldSubmitted: addP.setPrice,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a price name';
                                }
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Product Price",
                                prefixIcon:
                                    Icon(Icons.attach_money_sharp, color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ), //product price
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: TextFormField(
                              controller: addP.quantity,
                              onFieldSubmitted: addP.setQuantity,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a product quantity';
                                }
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Quantity",
                                prefixIcon: Icon(Icons.production_quantity_limits,
                                    color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                            ),
                          ), //for product quantity
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: TextFormField(
                              controller: addP.cat,
                              onFieldSubmitted: addP.setCat,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a product quantity';
                                }
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Category",
                                prefixIcon: Icon(Icons.category,color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: TextFormField(
                              controller: addP.contatct,
                              onFieldSubmitted: addP.setContact,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'please enter a product quantity';
                                }
                              },
                              autocorrect: false,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                hintText: "Contact Info",
                                prefixIcon: Icon(Icons.phone_android,color: c4),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 0.4),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: DropdownButton<String>(
                              value: addP.select_cat.text,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? newValue) {
                                addP.set_select_cat(newValue!);
                              },
                              items: <String>['One', 'Two', 'Free', 'Four']
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.02,
                              constraints.maxHeight * 0.01,
                            ),
                            child: Row(children: [
                              new Flexible(
                                child: TextFormField(
                                  controller: addP.dis1,
                                  onFieldSubmitted: addP.setDis1,
                                  textAlign: TextAlign.center,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the first discount';
                                    }
                                  },
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Dis1",
                                    prefixIcon:
                                        Icon(Icons.emoji_symbols, color: c4),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              new Flexible(
                                child: TextFormField(
                                  controller: addP.dis2,
                                  textAlign: TextAlign.center,
                                  onFieldSubmitted: addP.setDis2,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the second discount';
                                    }
                                  },
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Dis2",
                                    prefixIcon:
                                        Icon(Icons.emoji_symbols, color: c4),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                              ),
                              new Flexible(
                                child: TextFormField(
                                  controller: addP.dis3,
                                  textAlign: TextAlign.center,
                                  onFieldSubmitted: addP.setDis3,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please enter the third discount';
                                    }
                                    //if (value<100) {
                                    //   return 'please enter the third discount';
                                    // }
                                  },
                                  autocorrect: false,
                                  decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    hintText: "Dis3",
                                    prefixIcon:
                                        Icon(Icons.emoji_symbols, color: c4),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 0.4),
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.next,
                                ),
                              )
                            ]
                                // [
                                //]
                                ),
                          ), //product discounts
                        ],
                      ),
                    ),
                  ),
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: c1,
                    tooltip: 'AddProduct',
                    child: const Icon(Icons.add),
                    onPressed: () {
                      print(addP.dis1.value);
                      print(addP.dis2.value);
                      print(addP.dis3.value);
                    },
                  ),
                );
              });
            }
        )
    );
  }
}
