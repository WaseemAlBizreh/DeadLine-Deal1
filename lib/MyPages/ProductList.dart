import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Variables.dart';

class Product_list extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductApiProvider(),
      child: Consumer<ProductApiProvider>(
        builder: (context, data, child) {
          data.ShowAllData();
          return LayoutBuilder(
            builder: (context, constraints) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: c1,
                  title: Text("Products"),
                  actions:[Icon(Icons.search)],
                ),
                drawer: Drawer(
                  child: ListView(
                    children: <Widget>[
                      DrawerHeader(
                        decoration: BoxDecoration(
                          color: c1,
                        ),
                        child: Container(
                          child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                  AssetImage('assets/imgs/sus.png'),
                                  backgroundColor: Colors.transparent,
                                ),
                                ListTile(
                                  contentPadding: EdgeInsets.fromLTRB(90, 1, 90, 1),
                                  title: Text("user name"),
                                  subtitle: Text("user email"),
                                )
                              ],
                            ),
                        ),
                      ),
                      ListTile(
                        title: Text(""),
                      )
                    ],
                  )),
                body: ListView.builder(
                  itemCount: data.product.length,
                  itemBuilder: (context,index) {
                    return Center(
                      child: Text("hello"),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
