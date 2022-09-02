import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';

import '../Variables.dart';
import 'EditProduct.dart';
import 'ProductList.dart';

class ShowProduct extends StatelessWidget {
  late final ResProduct product;
  ShowProduct({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApiProvider>(
      builder: (context, data, child) {
        return LayoutBuilder(builder: (context, constraints) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: c3,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: c1,
                ),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    Icons.create_sharp,
                    color: c1,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => EditProductPage(
                              product: product,
                            )));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: c1,
                  ),
                  onPressed: () {
                    data.DeleteProduct(product.id).then((msg) {
                      if (msg) {
                        Fluttertoast.showToast(
                            msg: 'Deleted Successfully',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => Product_list()));
                      } else {
                        Fluttertoast.showToast(
                            msg: 'failed Delete try again',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.blueGrey,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    });
                  },
                ),
              ],
            ),
            body: Container(
              height: constraints.maxHeight,
              width: constraints.maxHeight,
              decoration: BoxDecoration(
                color: c3,
              ),
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
                          margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.8,
                              constraints.maxHeight * 0.25,
                              constraints.minWidth * 0.003,
                              constraints.minHeight * 0.002),
                          child: LikeButton(
                            size: constraints.maxHeight * 0.04,
                            circleColor: CircleColor(
                                start: Color(0xff00ddff),
                                end: Color(0xff0099cc)),
                            bubblesColor: BubblesColor(
                              dotPrimaryColor: Color(0xff33b5e5),
                              dotSecondaryColor: Color(0xff0099cc),
                            ),
                            likeBuilder: (isLiked){
                              data.setid(product.id);
                              isLiked = product.isLike;
                              return Icon(
                                Icons.thumb_up,
                                color: isLiked ? c1 : Colors.grey,
                                size: constraints.maxHeight * 0.04,
                              );
                            },
                            likeCount: product.like,
                            onTap: data.onLikeTap,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin:
                          EdgeInsets.only(top: constraints.maxHeight * 0.3),
                          height: constraints.maxHeight * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                                left: constraints.maxWidth * 0.1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: constraints.maxHeight * 0.04,
                                ),
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
                                    SizedBox(
                                      width: constraints.maxWidth * 0.1,
                                    ),
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
                                SizedBox(
                                  height: constraints.maxHeight * 0.04,
                                ),
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
                                              text: '\$${product.price}',
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
                                SizedBox(
                                  height: constraints.maxHeight * 0.04,
                                ),
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
                                    SizedBox(
                                      width: constraints.maxWidth * 0.1,
                                    ),
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: c1,
              tooltip: 'comment',
              child: const Icon(Icons.comment),
              onPressed: () {
                Bottonsheets(context);
              },
            ),
          );
        });
      },
    );
  }
}

void Bottonsheets(context) {
  showMaterialModalBottomSheet(
    context: context,
    builder: (builder) {
      return new Container(
        height: 450.0,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: Container(
            decoration: new BoxDecoration(
                color: c3,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0))),
            child: new Center(
              child: new Text("This is a modal sheet"),
            )),
      );
    },
  );
}
