import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';

class ProductApiProvider with ChangeNotifier {
  List<ResProduct> _product = [];
  List<ResProduct> get product => _product;

  Future<void> ShowAllData() async {
    //change this
    String url = "https://pastebin.com/raw/Hx38Abcq";
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
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ResProduct> AddProduct(ReqProduct requestModel) async {
    //change url
    String url = " ";
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        },
        body: requestModel.toJson()
    ).catchError((e){
      if(e is SocketException){
        throw 'No Internet Connection';
      }
      throw e;
    });
    //change response status
    if (response.statusCode == 200){
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return ResProduct.fromJson(jsonData);
    }
    else{
      throw Exception('Failed to load products');
    }
  }
}
