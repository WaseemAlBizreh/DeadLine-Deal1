import 'UserModel.dart';

class registerResponseModel {
  late user User;

  registerResponseModel({
    required this.User,
  });
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