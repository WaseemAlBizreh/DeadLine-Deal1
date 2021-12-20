//import 'package:flutter/cupertino.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert' as convert;
//import 'package:waseem/MyPages/Register.dart';

class LoginResponseModel {
  final String token;
  final String error;

  LoginResponseModel({required this.token,required this.error});
factory LoginResponseModel.fromJson(Map<String,dynamic>json){
  return LoginResponseModel(token: json["token"], error: json["error"]);
}
}

class LoginRequestModel{
   late String email;
   late String password;

LoginResponseModel ({
     email,
     password,
}) {}
Map<String , dynamic> toJson(){
     Map<String , dynamic> map={
       'email':email.trim(),
       'password':password.trim(),
     };
return map;
}
}
































// main(){
//
//   // MyRequester.storePost();
//   //print(MyRequester.storePost());
// }
// LoginPost({
//   @required UserName
// }) async{
//   var url = "https://jsonplaceholder.typicode.com/posts";
//   var UserName = await http.post(Uri.parse(url),
//   body:{'title':'username'});
//   var response = await http.post(Uri.parse(url),
//         body: {'userId': '1', 'id': '2', 'title': 'gla', 'body': 'est rerum'});
//     print(response.body);
// }


// class MyRequester {
//   static storePost() async {
//     var url = "https://jsonplaceholder.typicode.com/posts";
//     var response = await http.post(Uri.parse(url),
//         body: {'userId': '1', 'id': '2', 'title': 'gla', 'body': 'est rerum'});
//     print(response.body);
//   }
// }
