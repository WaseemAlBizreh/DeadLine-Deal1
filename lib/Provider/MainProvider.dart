import 'package:flutter/material.dart';
import 'package:waseem/Model/ProductModel.dart';

class MainProvider with ChangeNotifier{

  bool _isLoading = false;


  bool get Load => _isLoading;
  setLoading(){
    _isLoading = !_isLoading;
    notifyListeners();
  }

}