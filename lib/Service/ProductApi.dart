import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';
class ProductApiProvider with ChangeNotifier {

  ProductApiProvider(){
    ShowAllData();
  }

  List<ResProduct> _product = [];
  List<ResProduct> get product => _product;

  Future<List<ResProduct>> ShowAllData() async {
    //change this
    String url = "https://pastebin.com/raw/zTDh9VuM";
    http.Response response = await http.get(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        }
    ).catchError((e){
      if(e is SocketException){
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData);
      List<ResProduct> products = Singlelist.products_list.map((e) => ResProduct.fromJson(e)).toList();
      _product = products;
      notifyListeners();
      return products;
    } else {
      throw 'Failed to load products';
    }
  }
}
