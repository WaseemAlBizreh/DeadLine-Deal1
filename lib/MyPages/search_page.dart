import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:waseem/Service/SearchApi.dart';
import 'package:waseem/Variables.dart';

import 'ShowProduct.dart';

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> SearchApiProvider(),
      child: Consumer<SearchApiProvider>(builder: (context, data, child){
        return LayoutBuilder(
          builder: (context, constraints){
            return Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                 children :[
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                              constraints.maxHeight * 0.02,
                              constraints.maxWidth * 0.18,
                              0.0,
                              0.0
                          ),
                          color: c1,
                          height: constraints.maxHeight * 0.2,
                          width: double.infinity,
                          child: Text('Welcome To\n DeadLins Deals',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: constraints.maxWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.1,
                          width: double.infinity ,
                          color: Colors.white,
                        ),
                        Container(
                          height: constraints.maxHeight * 0.8,
                          width: double.infinity ,
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: data.search.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (_)=> ShowProduct(
                                        product: data.search[index],)));
                                },
                                child: Container(
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
                                                data.search[index].image,
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
                                                child: Text(
                                                  '${data.search[index].quantity}',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: constraints.maxWidth * 0.02,
                                      ),
                                      Container(
                                        margin: EdgeInsets.all(
                                          constraints.maxWidth *0.01,
                                        ),
                                        height: constraints.maxHeight * 0.15,
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: constraints.maxHeight *0.01,
                                            ),
                                            Text(
                                              data.search[index].name,
                                              style: TextStyle(
                                                fontSize: constraints.maxWidth * 0.04,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              data.search[index].category,
                                              style: TextStyle(
                                                fontSize: constraints.maxWidth * 0.04,
                                                fontWeight: FontWeight.w300,
                                                color: c4,
                                              ),
                                            ),
                                            SizedBox(
                                              height: constraints.maxHeight *0.01,
                                            ),
                                            Text(
                                                '\$${data.search[index].init_price}',
                                                style: TextStyle(
                                                  decoration:
                                                  TextDecoration.lineThrough,
                                                  fontWeight: FontWeight.w400,
                                                  color: c5,
                                                )),
                                            Text(
                                              '\$${data.search[index].price}',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff8e0000),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                   Column(
                     children: [
                       SizedBox(
                         height: constraints.maxHeight * 0.165,
                       ),
                       Container(
                         margin: EdgeInsets.fromLTRB(constraints.maxWidth * 0.07, 0,
                             constraints.maxWidth * 0.07,0),
                           child: TextFormField(
                             validator: (value) {
                               if (value!.isEmpty) {
                                 return 'please enter EmailAddress';
                               }
                             },
                             autocorrect: false,
                             decoration: InputDecoration(
                               fillColor:Colors.white,
                               filled: true,
                               hintText: "Search By Name",
                               prefixIcon: Icon(Icons.search, color: c4),
                               border: OutlineInputBorder(
                                 borderSide: BorderSide(width: 0.4),
                                 borderRadius: BorderRadius.circular(30.0),
                               ),
                             ),
                             keyboardType: TextInputType.text,
                             textInputAction: TextInputAction.search,
                           ),
                         ),
                       Row(
                         children: [
                           Container(
                             margin: EdgeInsets.fromLTRB(
                               constraints.maxWidth * 0.08,
                               constraints.maxHeight * 0.01,
                               0.0,
                               constraints.maxHeight * 0.02,
                             ),
                             child:ElevatedButton(
                               onPressed: () {
                                 data.datepicker(context);
                               },
                               child: data.date_search == DateTime(0)
                                   ? Text('Expiration Date')
                                   : Text(
                                   'Date : ${DateFormat('yyyy-MM-dd').format(data.date_search)}'
                               ),
                               style: ButtonStyle(
                                 shape: MaterialStateProperty.all(
                                   RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10),
                                   ),
                                 ),
                                 padding: MaterialStateProperty.all(
                                     EdgeInsets.fromLTRB(
                                       constraints.maxWidth * 0.05,
                                       constraints.maxHeight * 0.01,
                                       constraints.maxWidth * 0.06,
                                       constraints.maxHeight * 0.01,
                                     )),
                                 elevation: MaterialStateProperty.all(10),
                                 backgroundColor: MaterialStateProperty.all(c1),
                               ),
                             ),
                           ),
                            Container(
                              margin: EdgeInsets.only(left: constraints.maxWidth * 0.2),
                              child: DropdownButton<String>(
                                alignment: Alignment.center,
                                value: data.select_cat_to.text,
                                icon: Icon(Icons.arrow_downward,color: c1,size:30),
                                elevation: 16,
                                underline: Container(
                                height: 2,
                                color: Colors.black,
                                ),
                              onChanged:(String? val){
                                data.set_select_cat_to(val!);
                                },
                              items: category.map<DropdownMenuItem<String>>((String value) {
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
                         ],
                       )
                     ],
                   ),
                ],
             ),
              ),
             );
            }
           );
          }
       ),
    );

  }
}
