import 'package:flutter/material.dart';

class MainProvider with ChangeNotifier{
  bool _isLoading = false;
  late String _token;

  bool get Load => _isLoading;
  setLoading(){
    _isLoading = !_isLoading;
    notifyListeners();
  }

  String get token => _token;
  setToken(String token){
    _token = token;
    notifyListeners();
  }

}