import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../Variables.dart';

class UpdateProduct with ChangeNotifier {

  UpdateProduct(String cat , String name , String Qun , String contact) {
    this._select_cat.text = cat;
    this._NameController.text = name;
    this._ContactController.text = contact;
    this._QuantityController.text = Qun;
  }

  XFile? _imageFile;
  XFile? get imageFile => _imageFile;
  TextEditingController _NameController = TextEditingController();
  TextEditingController _ContactController = TextEditingController();
  TextEditingController _QuantityController = TextEditingController();
  TextEditingController _select_cat = TextEditingController();

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

  TextEditingController get quantity => _QuantityController;
  setQuantity(String quantity) {
    _QuantityController.text = quantity;
    notifyListeners();
  }

  Future EditProductApi(XFile image , String name ,String contact , String cat
      , double qun , int id) async {
    //url
    String url = "https://laravel-project-master.000webhostapp.com/api/update/${id}";
    try{
      var request = http.MultipartRequest(
          'POST',Uri.parse(url));
      //header
      request.headers.addAll({
        'Accept': 'application/json',
        'auth-token': token.toString(),
      });
      request.fields.addAll({
        'name': name ,
        'contact': contact,
        'category': cat,
        'quantity': '${qun}'
      });
      if(image != null){
        var image_file = await http.MultipartFile.fromPath('image',image.path).catchError((e){
          throw e;
        });

        request.files.add(image_file);
      }
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


  Future EditProductApi_noImg(String name ,String contact , String cat
      , double qun , int id) async {
    //url
    String url = "https://laravel-project-master.000webhostapp.com/api/update/${id}";
    try{
      var request = http.MultipartRequest(
          'POST',Uri.parse(url));
      //header
      request.headers.addAll({
        'Accept': 'application/json',
        'auth-token': token.toString(),
      });
      request.fields.addAll({
        'name': name ,
        'contact': contact,
        'category': cat,
        'quantity': '${qun}'
      });
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