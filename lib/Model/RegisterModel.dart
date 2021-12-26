class registerResponseModel {
  String? error;
  late String token;

  registerResponseModel({
    this.error,
    required this.token
  });

  factory registerResponseModel.fromJson(Map<String, dynamic> jsonRegData) {
    return registerResponseModel(
        token: jsonRegData['token'] != null ? jsonRegData['token'] : "",
        error: jsonRegData['error'] != null ? jsonRegData['error'] : "");
  }
}

class registerRequestModel {
  late String UserName;
  late String Email;
  late String Password;
  late String C_Password;

  registerRequestModel({
    required this.UserName,
    required this.Email,
    required this.Password,
    required this.C_Password,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> regMap = {
      'name': UserName,
      'email': Email,
      'password': Password,
      'c_password': C_Password
    };
    return regMap;
  }
}
