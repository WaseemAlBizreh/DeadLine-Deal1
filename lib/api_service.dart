//import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
//import 'package:waseem/MyPages/Register.dart';
import 'package:waseem/login_model.dart';

class APIService{
  Future<LoginResponseModel> login(LoginRequestModel requestModel)async{
    String url="https://reqres.in/api/login";
    final response = await http.post(Uri.parse(url),body: requestModel.toJson());
  if(response.statusCode==200||response.statusCode==400) {
    return LoginResponseModel.fromJson(convert.jsonDecode(response.body));
  }else{
    throw Exception('Failed to load');
  }
  }
}