import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/UpdateApi.dart';

import '../Variables.dart';
import 'ProductList.dart';

class EditProductPage extends StatelessWidget {
  late ResProduct product;

  EditProductPage({
    required this.product,
  });
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    int vimg = 0;
    return ChangeNotifierProvider(
        create: (_) => UpdateProduct(product.category , product.name ,
            product.quantity.toString() , product.contact),
        child: Consumer<UpdateProduct>(builder: (context, addP, child) {
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
                              items: category.
                              map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value,
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
                                vimg++;
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
                                var qunatity = double.parse(addP.quantity.text);
                                assert(qunatity is double);
                                String cat = addP.select_cat.text;
                                String cont = addP.contatct.text;
                                String name = addP.name.text;
                                if(addP.imageFile != null){
                                  addP.EditProductApi(addP.imageFile!, name , cont, cat ,
                                      qunatity , product.id).then((msg) {
                                    if (msg) {
                                      Fluttertoast.showToast(
                                          msg: 'product update successfully',
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
                                          msg: 'fail to update\n try again',
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blueGrey,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  });
                                }else{
                                  addP.EditProductApi_noImg(name , cont, cat ,
                                      qunatity , product.id).then((msg) {
                                    if (msg) {
                                      Fluttertoast.showToast(
                                          msg: 'product update successfully',
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
                                          msg: 'fail to update\n try again',
                                          toastLength: Toast.LENGTH_LONG,
                                          gravity: ToastGravity.BOTTOM,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor: Colors.blueGrey,
                                          textColor: Colors.white,
                                          fontSize: 16.0);
                                    }
                                  });
                                }
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
                        ), //edit button
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
