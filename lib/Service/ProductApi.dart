import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';
import '../Variables.dart';

class ProductApiProvider with ChangeNotifier {
  ProductApiProvider() {
    ShowAllData();
  }

  List<ResProduct> _product = [];
  List<ResProduct> get product => _product;

  int like_id = 0;
  int get id => like_id;
  setid(int id) {
    like_id = id;
    notifyListeners();
  }

  Future<List<ResProduct>> ShowAllData() async {
    String url =
        "https://laravel-project-master.000webhostapp.com/api/showAll"; //change this to https://laravel-project-master.000webhostapp.com/showAll
    http.Response response = await http.get(Uri.parse(url), headers: {
      'Accept': 'application/json',
      'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHR'
          'wczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNv'
          'bVwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTY0MTcxMzkwMSwiZXhwIjoxNjQ'
          'xODAwMzAxLCJuYmYiOjE2NDE3MTM5MDEsImp0aSI6Ik5vZTY1dUk2WGJJZjd1d2'
          '0iLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYW'
          'RiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.SSjkQeYl6S7em-08n_8lG'
          'xP0mu6iUNbOgnBmcoF6Sko',
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

  Future DeleteProduct(int id) async {
    String DelUrl =
        "https://laravel-project-master.000webhostapp.com/api/delete/${id}";
    http.Response response = await http.get(Uri.parse(DelUrl), headers: {
      'Accept': 'application/json',
      'auth-token':
          'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsImp0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
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
    } else {
      msg = false;
      return msg;
    }
  }

  Future Views(int id) async {
    String Url =
        "https://laravel-project-master.000webhostapp.com/api/views/${id}";
    http.Response response = await http.get(Uri.parse(Url), headers: {
      'Accept': 'application/json',
      'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZ'
          'lbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3Rl'
          'ciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsIm'
          'p0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMz'
          'llNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
    }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
  }

  Future<bool> onLikeTap(bool isLiked) async {
    String Url =
        "https://laravel-project-master.000webhostapp.com/api/likes/${id}";
    http.Response response = await http.post(Uri.parse(Url), headers: {
      'Accept': 'application/json',
      'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZ'
          'lbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3Rl'
          'ciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsIm'
          'p0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMz'
          'llNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
    }).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    return !isLiked;
  }
}
