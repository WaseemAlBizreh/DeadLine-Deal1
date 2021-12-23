import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();

  TextEditingController get email => _EmailController;
  setEmail(String email) {
    _EmailController.text = email;
    notifyListeners();
  }
  TextEditingController get pass => _PassController;
  setPass(String pass) {
    _PassController.text = pass;
    notifyListeners();
  }
  // late String _email;
  //
  // String get email => _email;
  // setEmail(String email) {
  //   _email = email;
  //   notifyListeners();
  // }

}