import 'package:flutter/material.dart';

class RegisterProvider with ChangeNotifier {
  TextEditingController _NameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PassController = TextEditingController();
  TextEditingController _CPassController = TextEditingController();

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
