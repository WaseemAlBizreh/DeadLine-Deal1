class loginResponseModel {
  String? error;
  late String token;

  loginResponseModel({
    required this.token,
    this.error,
  });

  factory loginResponseModel.fromJson(Map<String , dynamic> jsonData){
    return loginResponseModel(
        token: jsonData['token'] != null? jsonData['token'] : "",
        error: jsonData['error'] != null? jsonData['error'] : ""
    );
  }
}

class loginRequestModel {
  late String password;
  late String email;

  loginRequestModel({
    required this.password,
    required this.email,
  });

  Map<String , dynamic> toJson(){
    Map<String , dynamic> loginMap = {
      'email': email.trim(),
      'password': password.trim(),
    };
    return loginMap;
  }
}
