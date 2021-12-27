import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';

class MainProvider with ChangeNotifier{
  bool _isLoading = false;
  List<ResProduct> _product = [];

  bool get Load => _isLoading;
  setLoading(){
    _isLoading = !_isLoading;
    notifyListeners();
  }

  List<ResProduct> get product => _product;
  set_product(List<ResProduct> product) {
    _product = product;
    notifyListeners();
  }

}