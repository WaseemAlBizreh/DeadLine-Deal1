import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ReqProduct {
  // change product model
  late String name;
  late DateTime endDate; //Date
  late String contact;
  late String category;
  double quantity;//
  double price;//
  int days1;
  int days2;
  int days3;
  double discount1_percentage;
  double discount2_percentage;
  double discount3_percentage;

  ReqProduct({
    required this.name,
    required this.endDate,
    required this.price,
    required this.quantity,
    required this.contact,
    required this.category,
    required this.days1,
    required this.days2,
    required this.days3,
    required this.discount1_percentage,
    required this.discount2_percentage,
    required this.discount3_percentage
  });

  Map<String, String> toJson() {
    Map<String, String> ProductMap = {
      'name': name,
      'endDate': '${endDate}',
      'price': '${price}',
      'quantity': '${quantity}',
      'contact': contact,
      'cat_Id': category,
      'r1': '${days1}',
      'r2': '${days2}',
      'r3': '${days3}',
      'dis1': '${discount1_percentage}',
      'dis2': '${discount2_percentage}',
      'dis3': '${discount3_percentage}',
    };
    return ProductMap;
  }
}

class ResProduct {
  late String name;
  late String image; // File
  late String endDate; //Date
  late String contact;
  late String category;
  double quantity;
  double init_price;
  double main_price;
  int days;
  int id;
  int views;

  ResProduct({
    required this.name,
    required this.image,
    required this.endDate,
    required this.init_price,
    required this.main_price,
    required this.quantity,
    required this.contact,
    required this.category,
    required this.days,
    required this.id,
    required this.views,
  });

  factory ResProduct.fromJson(Map<String, dynamic> jsonData) {
    return ResProduct(
      name: jsonData['name'] as String,
      image: jsonData['image'],
      endDate: jsonData['endDate'],
      init_price: jsonData['init_price'],
      main_price: jsonData['price'],
      quantity: jsonData['quantity'],
      contact: jsonData['contact'],
      days: jsonData['days'],
      id: jsonData['id'],
      category: jsonData['cat_Id'],
      views: jsonData['views'],
    );
  }
}

class product_list {
  late List<dynamic> products_list;

  product_list({required this.products_list});

  factory product_list.fromJson(jsonData) {
    return product_list(
      products_list: jsonData,
    );
  }
}
