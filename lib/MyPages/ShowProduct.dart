import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    return Consumer<ProductApiProvider>(
      builder: (context,data,child){
        return LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: c3,
              elevation: 0,
              leading: IconButton(
                onPressed: () {Navigator.pop(context);},
                icon: Icon(Icons.arrow_back, color: c1,),
              ),
              actions: [
                IconButton(
                  icon: Icon(Icons.create_sharp , color: c1,),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: c1,),
                  onPressed: () {
                    data.DeleteProduct(product.id).then((msg){
                      if(msg){
                        Fluttertoast.showToast(
                            msg: 'Deleted Successfully',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }else{
                        Fluttertoast.showToast(
                            msg: 'failed Delete try again',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0
                        );
                      }
                    });
                  },
                ),
              ],
            ),
            body: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(color: c3,),
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
                          alignment: Alignment.topCenter,
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: constraints.maxHeight * 0.3),
                          height: constraints.maxHeight * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Container(
                            padding:
                            EdgeInsets.only(left: constraints.maxWidth * 0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: constraints.maxHeight * 0.04,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Name\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${product.name}',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: constraints.maxWidth * 0.1,),
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Category\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${product.category}',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: constraints.maxHeight * 0.04,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'price\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '\$${product.main_price}',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Quantity\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${product.quantity} ',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Days left\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${product.days}',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: constraints.maxHeight * 0.04,),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RichText(
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text: 'Expiration date\n',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18,
                                              ),
                                            ),
                                            TextSpan(
                                              text: '${product.endDate}',
                                              style: TextStyle(
                                                color: c1,
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: constraints.maxWidth * 0.1,),
                                    Container(
                                      // decoration: BoxDecoration(
                                      //   border: Border.all(
                                      //       color: c1),
                                      // ),
                                      child: Expanded(
                                        flex: 1,
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: 'Contact Info\n',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              TextSpan(
                                                text: '${product.contact}',
                                                style: TextStyle(
                                                  color: c1,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      },
    );
  }
}
