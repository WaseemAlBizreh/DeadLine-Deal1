import 'package:flutter/material.dart';

class Product{
  // change product model
  late String name;
  late String image; // File
  late DateTime endDate; //Date
  late String contact;
  late String category;
  int quantity;
  int price;
  int  days1;
  int  days2;
  int  days3;
  double discount1_percentage;
  double discount2_percentage;
  double discount3_percentage;

  Product({
    required this.name,
    required this.image,
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

  factory Product.fromJson(Map<String , dynamic> jsonData){
    return Product(
      name: jsonData['name'] as String,
      image: jsonData['image'] as String,
      endDate: jsonData['endDate'],
      price: jsonData['price'],
      quantity: jsonData['quantity'],
      contact: jsonData['contact'],
      days1: jsonData['r1'],
      days2: jsonData['r2'],
      days3: jsonData['r3'],
      category: jsonData['cat_Id'],
      discount1_percentage: jsonData['dis1'],
      discount2_percentage: jsonData['dis2'],
      discount3_percentage: jsonData['dis3'],
    );
  }
  Map<String , dynamic> toJson(){
    Map<String , dynamic> ProductMap = {
      'name': name,
      'image': image,
      'endDate': endDate,
      'price': price,
      'quantity': quantity,
      'contact': contact,
      'category': category,
      'r1': days1,
      'r2': days2,
      'r3': days3,
      'dis1': discount1_percentage,
      'dis2': discount2_percentage,
      'dis3': discount3_percentage,
    };
    return ProductMap;
  }
}

class product_list{
  late List<dynamic> products_list;

  product_list({
    required this.products_list
  });

  factory product_list.fromJson(jsonData){
    return product_list(
      products_list: jsonData,
    );
  }
}