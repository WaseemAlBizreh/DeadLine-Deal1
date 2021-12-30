import 'package:flutter/material.dart';


class ProductApiProvider with ChangeNotifier{
TextEditingController _NameController = TextEditingController();
TextEditingController _Price = TextEditingController();

TextEditingController get name => _NameController;
setName(String name) {
  _NameController.text = name;
  notifyListeners();
}}