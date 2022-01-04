import 'package:flutter/material.dart';
import 'package:waseem/Service/ProductApi.dart';
import 'package:provider/provider.dart';

import 'AddProductPage.dart';
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
              body: FutureBuilder(
                  future: fetchData,
                  builder: (context, snapshot) {
                    print(data.product.length);
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: data.product.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: constraints.maxHeight * 0.15,
                            width: constraints.maxWidth * 0.5,
                            margin: EdgeInsets.fromLTRB(
                              constraints.maxWidth * 0.03,
                              constraints.maxHeight * 0.01,
                              constraints.maxWidth * 0.03,
                              constraints.maxHeight * 0.01,
                            ),
                            decoration: BoxDecoration(
                              color: c3,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Stack(
                                  children:[
                                    Container(
                                      width: constraints.maxWidth * 0.5,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8.0),
                                        child: Image.network(
                                          data.product[index].image,
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Container(
                                        padding: EdgeInsets.all(
                                            constraints.maxWidth * 0.01),
                                        color: c3,
                                        child: RotationTransition(
                                          turns: AlwaysStoppedAnimation(-35/360),
                                          child: Text('${data.product[index].quantity}'),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: constraints.maxWidth * 0.02,
                                ),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Text(
                                      data.product[index].name,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.05,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Text(
                                      data.product[index].category,
                                      style: TextStyle(
                                        fontSize: constraints.maxWidth * 0.04,
                                        fontWeight: FontWeight.w300,
                                        color: c4,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Text(
                                        '\$${data.product[index].init_price}',
                                        style: TextStyle(
                                          decoration:
                                          TextDecoration.lineThrough,
                                          fontWeight: FontWeight.w400,
                                          color: c5,
                                        )),
                                    SizedBox(
                                      height: constraints.maxHeight * 0.01,
                                    ),
                                    Text(
                                      '\$${data.product[index].main_price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff8e0000),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${snapshot.error}',
                                style: TextStyle(
                                    fontSize: constraints.maxWidth * 0.05,
                                    fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  onPressed: (){
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (_) => Product_list()));
                                  },
                                  style:ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(c1),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),),
                                    ),
                                  ),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(
                                      constraints.maxWidth * 0.03,
                                      constraints.maxHeight * 0.01,
                                      constraints.maxWidth * 0.03,
                                      constraints.maxHeight * 0.01,
                                    ),
                                    child: Text(
                                      'Refresh',
                                      style: TextStyle(
                                        fontSize:constraints.maxWidth * 0.04,
                                      ),
                                    ),
                                  )
                              )
                            ]),
                      );
                    }
                    return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.grey,
                          color: c1,
                        )
                    );
                  }),
              floatingActionButton: FloatingActionButton(
                  backgroundColor: c1,
                  tooltip: 'AddProduct',
                  child: const Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddProductPage()));
                  }),
            );
          },
        );
      },
    );
  }
}
