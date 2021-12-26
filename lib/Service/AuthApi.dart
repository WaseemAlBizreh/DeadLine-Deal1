import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:waseem/Model/loginModel.dart';
import 'package:waseem/Model/RegisterModel.dart';

class AuthApi {

  Future<loginResponseModel> login(loginRequestModel requestModel) async {
    //change url
    String url = "https://reqres.in/api/login";
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: requestModel.toJson()
    ).catchError((e){
      throw e;
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return loginResponseModel.fromJson(jsonData);
    }
    else if(response.statusCode == 400 || response.statusCode == 404) {
      throw HttpException('User Not Found');
    }
    else if(response.statusCode == 408) {
      throw HttpException('No Connection to the Internet');
    }
    else{
      throw HttpException('Request Error: ${response.statusCode}');
    }
  }

  Future<registerResponseModel> register(registerRequestModel registerRequest) async {
    String url = "https://reqres.in/api/register"; //to be filled from backend
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: registerRequest.toJson()
    ).catchError((e){
      throw e;
    });
    //change response status
    if (response.statusCode == 200 || response.statusCode == 401) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return registerResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to register User');
    }
  }

}
