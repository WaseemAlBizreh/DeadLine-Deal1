import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:waseem/Model/loginModel.dart';

class loginApi {
  Future<loginResponseModel> login(loginRequestModel requestModel) async {
    //change url
    String url = "https://reqres.in/api/login";
    http.Response response = await http.post(
        Uri.parse(url),
        headers: {'Accept': 'application/json'},
        body: requestModel.toJson()
    );
    //change response status
    if (response.statusCode == 200 || response.statusCode == 400 ){
      String Data = response.body;
      var jsonData = jsonDecode(Data);
      return loginResponseModel.fromJson(jsonData);
    }
    else{
      throw Exception('Failed to load User');
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
// });