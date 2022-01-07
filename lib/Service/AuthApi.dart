import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:waseem/Model/UserModel.dart';
import 'package:waseem/Model/loginModel.dart';
import 'package:waseem/Model/RegisterModel.dart';

import '../Variables.dart';

class AuthApi {

  Future<loginResponseModel> login(loginRequestModel loginRequest) async {
    //change url
    String url = "https://laravel-project-master.000webhostapp.com/api/auth/login";
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: loginRequest.toJson()
    ).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200 || response.statusCode == 401) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return loginResponseModel.fromJson(jsonData);
    }
    else if (response.statusCode == 400 || response.statusCode == 404) {
      throw 'User Not Found';
    }
    else if (response.statusCode == 408) {
      throw 'No Internet Connection';
    }
    else {
      throw 'Request Error: ${response.statusCode}';
    }
  }

  Future<registerResponseModel> register(registerRequestModel registerRequest) async {
    String url = "https://laravel-project-master.000webhostapp.com/api/auth/register"; //to be filled from backend
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: registerRequest.toJson()
    ).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    //change response status
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      user U = user.fromJson(jsonData['user']);
      return registerResponseModel(User: U);
    }
    else {
      throw 'Request Error: ${response.statusCode}';
    }
  }

  Future logout() async{
    String url = "https://laravel-project-master.000webhostapp.com/api/auth/logout";
    var request = http.Request('POST',
        Uri.parse(url));
    request.headers.addAll({
      'Content-Type': 'application/json',
      'auth-token': token.toString(),
    });

    http.StreamedResponse response = await request.send();
    bool msg;
    if (response.statusCode == 200) {
      msg = true;
      return msg;
    }
    else {
      msg = false;
      return msg;
    }
  }

  Future me() async{
    String url = "https://laravel-project-master.000webhostapp.com/api/auth/me";
    http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
        'auth-token': token.toString(),
      },
    ).catchError((e) {
      if (e is SocketException) {
        throw 'No Internet Connection';
      }
      throw e;
    });
    if (response.statusCode == 200) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return user(name: jsonData['name'], email: jsonData['email']);
    }
    else if(response.statusCode == 401){
      throw 'Unauthorized';
    }
    else {
      throw 'Request Error: ${response.statusCode}';
    }
  }
}