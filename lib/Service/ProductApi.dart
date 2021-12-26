import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

class ProductApi {

  Future<List<ResponseProduct>> fetchData() async {
    //change this
    String url = "https://pastebin.com/raw/zFjt73zf";
    http.Response response = await http.get(
        Uri.parse(url)).catchError((e){
      if(e is SocketException){
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData);
      List<ResponseProduct> products = Singlelist.products_list.map((e) => ResponseProduct.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<ResponseProduct> SendData(RequestProduct requestModel) async {
    //change url
    String url = 'C:/Users/USER/StudioProjects/waseem/lib/json.json';
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
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
      return ResponseProduct.fromJson(jsonData);
    }
    else{
      throw Exception('Failed to load products');
    }
  }
}
