import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/MyPages/AddProductPage.dart';
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
                  actions: [Icon(Icons.search)],
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
                              contentPadding: EdgeInsets.fromLTRB(90, 0, 90, 0),
                              title: Text("user name",
                                  style: TextStyle(color: Colors.white60)),
                              subtitle: Text("user email",
                                  style: TextStyle(color: Colors.white60)),
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
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text("hello"),
                    );
                  },
                ),
                floatingActionButton: FloatingActionButton(
                  backgroundColor: c1,
                  tooltip: 'AddProduct',
                  child: const Icon(Icons.add),
                  onPressed:() {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) =>AddProductPage()));

                  }
                ),
              );
            },
          );
        },
      ),
    );
  }
}
