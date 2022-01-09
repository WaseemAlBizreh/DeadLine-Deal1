import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';
class SearchApiProvider with ChangeNotifier {

  SearchApiProvider(){
    this._select_cat_to_search.text = "food";
  }

  List<ResProduct> _search = [];
  List<ResProduct> get search => _search;

  TextEditingController _select_cat_to_search = TextEditingController();
  TextEditingController get select_cat_to_search => _select_cat_to_search;
  set_select_cat_to_search(String value) {
    _select_cat_to_search.text = value;
    notifyListeners();
  }

  DateTime date_search = DateTime(0);

  Future<void> datepicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050)
    );
    if (picker != null && picker != date_search) {
      date_search = picker;
      notifyListeners();
    } else {
      return ;
    }
  }


  Future<void> SearchName(String name) async {
    String url = "https://laravel-project-master.000webhostapp.com/api/searchName";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsImp0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
        },
        body:{
          'name' : name,
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
      _search = products;
      notifyListeners();
    } else {
      throw 'Failed to Search';
    }
  }



  Future<void> SearchDate() async {
    String url = "https://laravel-project-master.000webhostapp.com/api/searchDate";
    http.Response response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsImp0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
        },
        body:{
          'date' : date_search,
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
      _search = products;
      notifyListeners();
    } else {
      throw 'Failed to Search';
    }
  }

}