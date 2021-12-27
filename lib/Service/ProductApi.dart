import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';

class ProductApi {
  Future<List<ResProduct>> ShowAllData() async {
    //change this
    String url = "https://pastebin.com/raw/8tEqYshx";
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
      return products;
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
