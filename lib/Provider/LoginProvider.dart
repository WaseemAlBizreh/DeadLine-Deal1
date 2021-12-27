import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  bool _visible = true;
  bool get visible => _visible;
  setvisible(){
    _visible = !_visible;
    notifyListeners();
  }

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

}