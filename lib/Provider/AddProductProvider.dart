import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';


class AddProductProvider with ChangeNotifier{
TextEditingController _NameController = TextEditingController();
MoneyMaskedTextController _PriceController = MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');

TextEditingController get name => _NameController;
setName(String name) {
  _NameController.text = name;
  notifyListeners();
}

MoneyMaskedTextController get price => _PriceController;
setPrice(String price) {
  _PriceController.text=price ;
  var dprice=double.parse(price);
  assert(dprice is double);
  notifyListeners();
}
}