import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';

class AddProduct with ChangeNotifier {

  AddProductProvider(){
    this._select_cat.text = "food";
  }

  DateTime date = DateTime(0);
  XFile? _imageFile;
  XFile? get imageFile => _imageFile;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _CatController = TextEditingController();
  TextEditingController _ContactController = TextEditingController();
  MoneyMaskedTextController _PriceController =
  MoneyMaskedTextController(decimalSeparator: '.', thousandSeparator: ',');
  TextEditingController _QuantityController = TextEditingController();
  TextEditingController _Dis1Controller = TextEditingController();
  TextEditingController _Dis2Controller = TextEditingController();
  TextEditingController _Dis3Controller = TextEditingController();
  TextEditingController _Days1Controller = TextEditingController();
  TextEditingController _Days2Controller = TextEditingController();
  TextEditingController _Days3Controller = TextEditingController();
  TextEditingController _select_cat = TextEditingController();

  Future<void> datepicker(BuildContext context) async {
    final DateTime? picker = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2050)
    );
    if (picker != null && picker != date){
      date = picker;
      notifyListeners();
    }else{
      return;
    }
  }
  
  Future setImage() async {
    var choosedImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    _imageFile = choosedImage;
    notifyListeners();
  }

  TextEditingController get select_cat => _select_cat;
  set_select_cat(String value) {
    _select_cat.text = value;
  }

  TextEditingController get name => _NameController;
  setName(String name) {
    _NameController.text = name;
    notifyListeners();
  }

  TextEditingController get cat => _CatController;
  setCat(String cat) {
    _CatController.text = cat;
    notifyListeners();
  }

  TextEditingController get contatct => _ContactController;
  setContact(String contact) {
    _ContactController.text = contact;
    notifyListeners();
  }

  MoneyMaskedTextController get price => _PriceController;
  setPrice(String price) {
    _PriceController.text = price;
    var dprice = double.parse(price);
    assert(dprice is double);
    notifyListeners();
  }

  TextEditingController get quantity => _QuantityController;
  setQuantity(String quantity) {
    _QuantityController.text = quantity;
    var dqunatity = double.parse(quantity);
    assert(dqunatity is double);
    notifyListeners();
  }

  TextEditingController get dis1 => _Dis1Controller;
  setDis1(String dis1) {
    _Dis1Controller.text = dis1;
    var dadis1 = double.parse(dis1);
    assert(dadis1 is double);
    notifyListeners();
  }

  TextEditingController get dis2 => _Dis2Controller;
  setDis2(String dis2) {
    _Dis2Controller.text = dis2;
    var dadis2 = double.parse(dis2);
    assert(dadis2 is double);
    notifyListeners();
  }

  TextEditingController get dis3 => _Dis3Controller;
  setDis3(String dis3) {
    _Dis3Controller.text = dis3;
    var dadis3 = double.parse(dis3);
    assert(dadis3 is double);
    notifyListeners();
  }
  TextEditingController get days1 => _Days1Controller;
  setDays1(String days1) {
    _Days1Controller.text = days1;
    var dadays1=double.parse(days1);
    assert(dadays1 is int);
    notifyListeners();
  }

  TextEditingController get days2 => _Days2Controller;
  setDays2(String days2) {
    _Days2Controller.text = days2;
    var dadays2=double.parse(days2);
    assert(dadays2 is double);
    notifyListeners();
  }

  TextEditingController get days3 => _Days3Controller;
  setDays3(String days3) {
    _Days3Controller.text = days3;
    var dadays3=double.parse(days3);
    assert(dadays3 is double);
    notifyListeners();
  }
  //Api
  Future AddProductApi(XFile image , ReqProduct requestModel) async {
    //url
    String url = " ";
    var request = http.MultipartRequest(
        'POST',Uri.parse(url));

    //header
    request.headers.addAll({
      'Accept': 'application/json',
      'auth-token': token.toString(),
    });

    //body
    request.fields.addAll(requestModel.toJson());
    var image_file = await http.MultipartFile.fromPath('image',image.path);
    request.files.add(image_file);

    http.StreamedResponse response = await request.send();
    //change response status
    if (response.statusCode == 200){
      throw await '${response.stream.bytesToString()}';
    }
    else{
      throw 'Failed to Add\n try again';
    }
  }

}
