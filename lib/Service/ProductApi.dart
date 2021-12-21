import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/product.dart';

class ProductApi {
  //change this
  String url = "https://pastebin.com/raw/v0PaaXVv";

  Future<List<product>> fetchData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      product_list Singlelist = product_list.fromJson(jsonData);
      List<product> products = Singlelist.products_list.map((e) => product.fromJson(e)).toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
