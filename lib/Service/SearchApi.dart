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

  Future datepicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050)
    );
    if (picker != null && picker != date_search) {
      date_search = picker;
      notifyListeners();
      return date_search;
    }
  }


  Future SearchName(String name) async {
    String url = "https://laravel-project-master.000webhostapp.com/api/searchName";
    var request = http.MultipartRequest('POST',
        Uri.parse(url));
    request.fields.addAll({
      'name': name
    });
    request.headers.addAll({
      'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpc'
          'L1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9'
          'hdXRoXC9sb2dpbiIsImlhdCI6MTY0MTcxMzkwMSwiZXhwIjoxNjQxODAwMzAxLCJuYm'
          'YiOjE2NDE3MTM5MDEsImp0aSI6Ik5vZTY1dUk2WGJJZjd1d20iLCJzdWIiOjIsInByd'
          'iI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.SSjkQe'
          'Yl6S7em-08n_8lGxP0mu6iUNbOgnBmcoF6Sko',
      'Accept': 'application/json'
    });
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    if (response.statusCode == 200) {
      String Data = respStr;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData);
      List<ResProduct> products =
      Singlelist.products_list.map((e) => ResProduct.fromJson(e)).toList();
      _search = products;
      notifyListeners();
    }
  }

  Future SearchDate() async {
    String url = "https://laravel-project-master.000webhostapp.com/api/searchDate";
    var request = http.MultipartRequest('POST',
        Uri.parse(url));
    request.fields.addAll({
      'endDate': '2022-12-23'
    });
    request.headers.addAll({
      'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwcz'
          'pcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBp'
          'XC9hdXRoXC9sb2dpbiIsImlhdCI6MTY0MTcxMzkwMSwiZXhwIjoxNjQxODAwMzAxLCJ'
          'uYmYiOjE2NDE3MTM5MDEsImp0aSI6Ik5vZTY1dUk2WGJJZjd1d20iLCJzdWIiOjIsInB'
          'ydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.SSjk'
          'QeYl6S7em-08n_8lGxP0mu6iUNbOgnBmcoF6Sko',
      'Accept': 'application/json'
    });
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    print(respStr.toString());
    if (response.statusCode == 200) {
      String Data = respStr;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData);
      List<ResProduct> products =
      Singlelist.products_list.map((e) => ResProduct.fromJson(e)).toList();
      _search = products;
      notifyListeners();
    }
  }

}