import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/loginModel.dart';
import 'package:waseem/Model/registerModel.dart';

class loginApi {
  Future<loginResponseModel> login(loginRequestModel loginRequest) async {
    //change url
    String url = "https://reqres.in/api/login";
    http.Response response = await http.post(Uri.parse(url),
        headers: {'Accept': 'application/json'}, body: loginRequest.toJson());
    //change response status
    if (response.statusCode == 200 || response.statusCode == 400) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return loginResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load User');
    }
  }
}

class regApi {
  Future<registerResponseModel> register(
      registerRequestModel registerRequest) async {
    String url = "https://reqres.in/api/register"; //to be filled from backend
    http.Response response = await http.post(Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: registerRequest.toJson());
    //change response status
    if (response.statusCode == 200 || response.statusCode == 400) {
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return registerResponseModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to register User');
    }
  }
}
// await http.post(
//     Uri.parse(url),
//     headers: {
//       'Accept': 'application/json',
//     },
//     body: {
//       "email": "eve.holt@reqres.in",
//       "password": "cityslicka"
//     }).then((response){
//   print('res st: ${response.statusCode}');
//   print('res body: ${response.body}');
// })};
