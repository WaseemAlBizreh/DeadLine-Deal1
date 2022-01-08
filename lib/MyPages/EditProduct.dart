import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/AddProductApi.dart';

import '../Variables.dart';
import 'ProductList.dart';

class EditProductPage extends StatelessWidget {
  late final ResProduct product;
  EditProductPage({
    required this.product,
  });
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => AddProduct(),
        child: Consumer<AddProduct>(builder: (context, addP, child) {
          addP.setName(product.name);
          addP.setContact(product.contact);
          //addP.setQuantity(product.quantity);
          addP.set_select_cat(product.category);
          //addP.imageFile;
          return LayoutBuilder(builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: c1,
                title: Text("Edit Your Product"),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
              ),
              body: SingleChildScrollView(
                child: Container(
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                    color: c3,
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
                            constraints.maxHeight * 0.02,
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
                            constraints.maxHeight * 0.02,
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
                            constraints.maxHeight * 0.02,
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
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                          ),
                        ), //for contact info
                        Row(children: [
                          Container(
                            margin: EdgeInsets.only(
                                left: constraints.maxWidth * 0.2),
                            child: DropdownButton<String>(
                              alignment: Alignment.center,
                              value: addP.select_cat.text,
                              icon: Icon(Icons.arrow_downward,
                                  color: c1, size: 30),
                              elevation: 16,
                              underline: Container(
                                height: 2,
                                color: Colors.black,
                              ),
                              onChanged: (String? val) {
                                addP.set_select_cat(val!);
                              },
                              items: category.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      color: c1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: constraints.maxWidth * 0.2),
                            child: FloatingActionButton(
                              backgroundColor: c1,
                              child: Icon(Icons.add_a_photo),
                              onPressed: () {
                                addP.setImage();
                              },
                            ),
                          ),
                        ]), //dropdown category and photo
                        Container(
                          margin: EdgeInsets.fromLTRB(
                            constraints.maxWidth * 0.28,
                            constraints.maxHeight * 0.01,
                            constraints.maxWidth * 0.28,
                            0,
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formkey.currentState!.validate()) {
                                var price = double.parse(addP.price.text);
                                assert(price is double);
                                var qunatity = double.parse(addP.quantity.text);
                                assert(qunatity is double);
                                var dis1 = double.parse(addP.dis1.text);
                                assert(dis1 is double);
                                var dis2 = double.parse(addP.dis2.text);
                                assert(dis2 is double);
                                var dis3 = double.parse(addP.dis3.text);
                                assert(dis3 is double);
                                var days1 = int.parse(addP.days1.text);
                                assert(days1 is int);
                                var days2 = int.parse(addP.days2.text);
                                assert(days2 is int);
                                var days3 = int.parse(addP.days3.text);
                                assert(days3 is int);
                                ReqProduct add = ReqProduct(
                                  name: addP.name.text,
                                  endDate: addP.date,
                                  contact: addP.contatct.text,
                                  category: addP.select_cat.text,
                                  quantity: qunatity,
                                  price: price,
                                  days1: days1,
                                  days2: days2,
                                  days3: days3,
                                  discount1_percentage: dis1,
                                  discount2_percentage: dis2,
                                  discount3_percentage: dis3,
                                );
                                XFile img = addP.imageFile;
                                addP.AddProductApi(img, add).then((msg) {
                                  if (msg) {
                                    Fluttertoast.showToast(
                                        msg: 'product edited successfully',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.blueGrey,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => Product_list()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'fail to edit\n try again',
                                        toastLength: Toast.LENGTH_LONG,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.blueGrey,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                  }
                                });
                              }
                            },
                            child: Row(children: [
                              Text(
                                "Edit Product",
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: constraints.maxWidth * 0.01,
                              ),
                              Icon(Icons.my_library_add_outlined)
                            ]),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.fromLTRB(
                                constraints.maxWidth * 0.05,
                                constraints.maxHeight * 0.01,
                                constraints.maxWidth * 0.05,
                                constraints.maxHeight * 0.01,
                              )),
                              elevation: MaterialStateProperty.all(10),
                              backgroundColor: MaterialStateProperty.all(c1),
                            ),
                          ),
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
