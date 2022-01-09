import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/CommentModel.dart';
import 'package:waseem/Model/ProductModel.dart';
import 'package:waseem/Model/UserModel.dart';
import '../Variables.dart';

class ProductApiProvider with ChangeNotifier {

  ProductApiProvider() {
    ShowAllData();
  }

  List<ResProduct> _product = [];
  List<ResProduct> get product => _product;

  List<ResComment> _comment = [];
  List<ResComment> get comment => _comment;

  Future<List<ResProduct>> ShowAllData() async {
    String url = "https://laravel-project-master.000webhostapp.com/api/showAll";//change this to https://laravel-project-master.000webhostapp.com/showAll
    http.Response response = await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData['products']);
      List<ResProduct> products =
      Singlelist.products_list.map((e) => ResProduct.fromJson(e)).toList();
      _product = products;
      notifyListeners();
      return products;
    } else {
      throw 'Failed to load products';
    }
  }

  Future DeleteProduct(int id) async{
    String DelUrl = "https://laravel-project-master.000webhostapp.com/api/delete/${id}";
    http.Response response = await http.get(Uri.parse(DelUrl),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    bool msg;
    if (response.statusCode == 200) {
      msg = true;
      return msg;
    }
    else {
      msg = false;
      return msg;
    }
  }

  Future Views(int id) async{
    String Url = "https://laravel-project-master.000webhostapp.com/api/views/${id}";
    http.Response response = await http.get(Uri.parse(Url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
  }

  Future Comment(int id) async{
    String Url = "https://laravel-project-master.000webhostapp.com/api/show/${id}";
    http.Response response = await http.get(Uri.parse(Url),
        headers: {
          'Accept': 'application/json',
          'auth-token': token.toString(),
        }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      comment_list Singlelist = comment_list.fromJson(jsonData['comments']);
      List<ResComment> com =
      Singlelist.com_list.map((e) => ResComment.fromJson(e)).toList();
      _comment = com;
      notifyListeners();
      return com;
    }
  }
}
