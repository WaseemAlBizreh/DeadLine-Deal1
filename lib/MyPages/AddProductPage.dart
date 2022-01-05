import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/AddProductApi.dart';

import '../Variables.dart';

class AddProductPage extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  String dropdownValue = "food";
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddProduct(),
        child: Consumer<AddProduct>(builder: (context, addP, child) {
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: c1,
                title: Text("Add Your Product"),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: c2,
                  ),
                  child: Form(
                    key: _formkey,
                    child: Column(
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
                            constraints.maxWidth * 0.04,
                            constraints.maxHeight * 0.01,
                            constraints.maxWidth * 0.08,
                            constraints.maxHeight * 0.01,
                          ),
                          child: Card(
                              color: c2,
                              child: ElevatedButton(
                                onPressed: () {
                                  addP.datepicker(context);
                                },
                                child: addP.date == DateTime(0)
                                    ? Text('Expiration Date')
                                    : Text(
                                    'Date : ${DateFormat('yyyy-MM-dd').format(addP.date)}'),
                              )),
                        ), //for expire date
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
                              prefixIcon: Icon(Icons.phone_android, color: c4),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 0.4),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                          ),
                        ), //for contact info
                        Row(children: [
                          Expanded(
                            flex: 1,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              style: TextStyle(
                                color: Colors.deepPurple,),
                              alignment: Alignment.centerRight,
                              underline: Container(
                                width: constraints.maxWidth * 0.03,
                                height: 2,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: null,
                              items: <String>[
                                "food",
                                "medicine",
                                "cosmetics",
                                "chemicals"
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FloatingActionButton(
                              child: Icon(Icons.add_a_photo),
                              onPressed: () {
                                addP.setImage().then((value) {
                                  print(value.path);
                                });
                              },
                            ),
                          ),
                        ]), //for dropdown category
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
                                controller: addP.days1,
                                onFieldSubmitted: addP.setDays1,
                                textAlign: TextAlign.center,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the first days count';
                                  }
                                },
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Days1",
                                  prefixIcon: Icon(Icons.today, color: c4),
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
                                controller: addP.days2,
                                textAlign: TextAlign.center,
                                onFieldSubmitted: addP.setDays2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the second days count';
                                  }
                                },
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Days2",
                                  prefixIcon: Icon(Icons.today, color: c4),
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
                                controller: addP.days3,
                                textAlign: TextAlign.center,
                                onFieldSubmitted: addP.setDays3,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'please enter the third days count';
                                  }
                                  //if (value<100) {
                                  //   return 'please enter the third discount';
                                  // }
                                },
                                autocorrect: false,
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: "Days3",
                                  prefixIcon: Icon(Icons.today, color: c4),
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
                        ), //for days
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
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            constraints.maxWidth * 0.27,
                            constraints.maxHeight * 0.01,
                            constraints.maxWidth * 0.25,
                            constraints.maxHeight * 0.01,
                          ),
                          child: Card(
                              color: c2,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Row(children: [
                                  Text("Add Product"),
                                  Icon(Icons.my_library_add_outlined )]),
                              )),
                        ), //add button
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        }));
  }
}
