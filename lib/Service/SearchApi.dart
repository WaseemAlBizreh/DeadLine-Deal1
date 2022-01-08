import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';
class SearchApiProvider with ChangeNotifier {
  List<ResProduct> _search = [];

  TextEditingController _select_cat_to_search = TextEditingController();

  List<ResProduct> get search => _search;

  DateTime date_search = DateTime(0);


    TextEditingController get select_cat_to => _select_cat_to_search;


  set_select_cat_to(String value) {
      _select_cat_to_search.text = value;
      notifyListeners();
    }


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
      return;
    }
  }


  Future<List<ResProduct>> ShowAllData() async {
    String url = "https://pastebin.com/raw/1cUWbZZN";//change this to https://laravel-project-master.000webhostapp.com/showAll
    http.Response response = await http.post(Uri.parse(url),
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
      _search = products;
      notifyListeners();
      return products;
    } else {
      throw 'Failed to load products';
    }
  }
}