import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';

import '../Variables.dart';
class Product_list extends StatefulWidget {
  @override
  State<Product_list> createState() => _Product_listState();
}

class _Product_listState extends State<Product_list> {
  late Future fetchData;
  @override
  void initState() {
    super.initState();
    fetchData = context.read<ProductApiProvider>().ShowAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductApiProvider>(
      builder: (context, data, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: c1,
                title: Text("Products"),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
              drawer: Drawer(
                child: ListView(children: [
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: c1,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                    title: const Text('Item 1'),
                    onTap: null,
                  ),
                ]),
              ),
              body: FutureBuilder(
                  future: fetchData,
                  builder: (context, snapshot) {
                    print(data.product.length);
                    if (snapshot.hasData) {
                      return Container(
                        child: ListView.builder(
                          itemCount: data.product.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: Text("hello"),
                            );
                          },
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                          child: Text('${snapshot.error}',
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.05,
                                fontWeight: FontWeight.bold),
                          ));
                    }
                    return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: c1,
                        ));
                  }),
            );
          },
        );
      },
    );
  }
}
