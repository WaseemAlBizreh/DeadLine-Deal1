import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier{
  TextEditingController _NameController = TextEditingController();

  TextEditingController get name => _NameController;
  setEmail(String name) {
    _NameController.text = name;
    notifyListeners();
  }

}