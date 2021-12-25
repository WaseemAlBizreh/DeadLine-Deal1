import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _CPassController = TextEditingController();

  bool _visible = true;
  bool _visible1 = true;

  bool get visible => _visible;
  setvisible(){
    _visible = !_visible;
    notifyListeners();
  }
  bool get visible1 => _visible1;
  setvisible1(){
    _visible1 = !_visible1;
    notifyListeners();
  }

  TextEditingController get name => _NameController;
  setName(String name) {
    _NameController.text = name;
    notifyListeners();
  }

  TextEditingController get email => _EmailController;
  setEmail(String email) {
    _EmailController.text = email;
    notifyListeners();
  }

  TextEditingController get pass => _PassController;
  setPass(String password) {
    _PassController.text = password;
    notifyListeners();
  }

  TextEditingController get cpass => _CPassController;
  setCPass(String cpass) {
    _CPassController.text = cpass;
    notifyListeners();
  }
}
