import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  bool _isLoading = true;

  bool get Load => _isLoading;
  setLoading(){
    _isLoading = !_isLoading;
    notifyListeners();
  }

}