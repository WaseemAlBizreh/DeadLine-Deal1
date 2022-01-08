import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/ProductModel.dart';

import '../Variables.dart';

class AddProduct with ChangeNotifier {

  AddProduct(){
    this._select_cat.text = "food";
  }

  DateTime date = DateTime(0);
  late XFile _imageFile;
  XFile get imageFile => _imageFile;

  TextEditingController _NameController = TextEditingController();
  TextEditingController _ContactController = TextEditingController();
  TextEditingController _QuantityController = TextEditingController();
  TextEditingController _PriceController = TextEditingController();
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
    _imageFile = choosedImage!;
    notifyListeners();
  }

  TextEditingController get select_cat => _select_cat;
  set_select_cat(String value) {
    _select_cat.text = value;
    notifyListeners();
  }

  TextEditingController get name => _NameController;
  setName(String name) {
    _NameController.text = name;
    notifyListeners();
  }

  TextEditingController get contatct => _ContactController;
  setContact(String contact) {
    _ContactController.text = contact;
    notifyListeners();
  }

  TextEditingController get price => _PriceController;
  setPrice(String price) {
    _PriceController.text = price;
    notifyListeners();
  }

  TextEditingController get quantity => _QuantityController;
  setQuantity(String quantity) {
    _QuantityController.text = quantity;
    notifyListeners();
  }

  TextEditingController get dis1 => _Dis1Controller;
  setDis1(String dis1) {
    _Dis1Controller.text = dis1;
    notifyListeners();
  }

  TextEditingController get dis2 => _Dis2Controller;
  setDis2(String dis2) {
    _Dis2Controller.text = dis2;

    notifyListeners();
  }

  TextEditingController get dis3 => _Dis3Controller;
  setDis3(String dis3) {
    _Dis3Controller.text = dis3;
    notifyListeners();
  }
  TextEditingController get days1 => _Days1Controller;
  setDays1(String days1) {
    _Days1Controller.text = days1;
    notifyListeners();
  }

  TextEditingController get days2 => _Days2Controller;
  setDays2(String days2) {
    _Days2Controller.text = days2;
    notifyListeners();
  }

  TextEditingController get days3 => _Days3Controller;
  setDays3(String days3) {
    _Days3Controller.text = days3;
    notifyListeners();
  }
  //Api
  Future AddProductApi(XFile image , ReqProduct requestModel) async {
    //url
    String url = "https://laravel-project-master.000webhostapp.com/api/add";
    try{
      var request = http.MultipartRequest(
          'POST',Uri.parse(url));
      //header
      request.headers.addAll({
        'Accept': 'application/json',
        'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsImp0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
      });
      //body
      request.fields.addAll(requestModel.toJson());
      var image_file = await http.MultipartFile.fromPath('image',image.path).catchError((e){
        throw e;
      });
      request.files.add(image_file);
      http.StreamedResponse response = await request.send().catchError((e){
        throw e;
      });
      bool msg;
      if (response.statusCode == 200) {
        msg = true;
        return msg;
      }
      else {
        msg = false;
        return msg;
      }
    }catch(e){
      throw e;
    }
  }
  //Api
  Future EditProductApi(XFile image , ReqProduct requestModel) async {
    //url
    String url = "https://laravel-project-master.000webhostapp.com/api/add";
    try{
      var request = http.MultipartRequest(
          'POST',Uri.parse(url));
      //header
      request.headers.addAll({
        'Accept': 'application/json',
        'auth-token': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvbGFyYXZlbC1wcm9qZWN0LW1hc3Rlci4wMDB3ZWJob3N0YXBwLmNvbVwvYXBpXC9hdXRoXC9yZWdpc3RlciIsImlhdCI6MTY0MTYyNzQxNSwiZXhwIjoxNjQxNzEzODE1LCJuYmYiOjE2NDE2Mjc0MTUsImp0aSI6IkVKM2haZG92SmF1cXE1WTQiLCJzdWIiOjIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.qapZy7VNX18BwhlhSy9BtEDs0A5_zZEiC8E-JHzFF2Y',
      });
      //body
      // var editname = _NameController.text;
      // var editprice = double.parse(_PriceController.text);
      // assert(editprice is double);
      // var editquantity = double.parse(_QuantityController.text);
      // assert(editquantity is double);
      // var editcontact = _ContactController.text;
      // var editcategory = _select_cat.text;
      // ReqProduct editP = ReqProduct(
      //     name:editname,
      //     contact:editcontact,
      //     category:editcategory,
      //     price:editprice,
      //     quantity:editquantity,
      //     days1:0,
      //     days2:0,
      //     days3:0,
      //     endDate:DateTime(0),
      //     discount1_percentage:0,
      //     discount2_percentage:0,
      //     discount3_percentage:0,
      // );
      request.fields.addAll(requestModel.toJson());
      var image_file = await http.MultipartFile.fromPath('image',image.path).catchError((e){
        throw e;
      });
      request.files.add(image_file);
      http.StreamedResponse response = await request.send().catchError((e){
        throw e;
      });
      bool msg;
      if (response.statusCode == 200) {
        msg = true;
        return msg;
      }
      else {
        msg = false;
        return msg;
      }
    }catch(e){
      throw e;
    }

  }

}