import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';

import '../Variables.dart';

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
                  title:Text("Products"),
                  actions: [
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: (){},
                    ),
                  ],
                ),
                drawer: Drawer(
                  child: ListView(
                      children:[
                        DrawerHeader(
                          decoration: BoxDecoration(
                            color: c1,
                          ),
                          child:Text('Drawer Header'),
                        ),
                        ListTile(
                          title: const Text('Item 1'),
                          onTap: null,
                        ),
                      ]
                  ),
                ),
                body: ListView.builder(
                  itemCount: 0,
                  itemBuilder: (context, index) {
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
