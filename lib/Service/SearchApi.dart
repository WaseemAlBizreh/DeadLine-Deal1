import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';
class SearchApiProvider with ChangeNotifier {
  List<ResProduct> _search = [];
  List<ResProduct> get search => _search;

}