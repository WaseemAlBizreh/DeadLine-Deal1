class registerResponseModel {
  String? error;
  late String token;
  registerResponseModel({this.error, required this.token});
  factory registerResponseModel.fromJson(Map<String, dynamic> jsonRegData) {
    return registerResponseModel(
        token: jsonRegData['token'] != null ? jsonRegData['token'] : "",
        error: jsonRegData['error'] != null ? jsonRegData['error'] : "");
  }
}

class registerRequestModel{
  late String UserName;
  late String Email;
  late String Pass;
  late String CPass;

  Map<String,dynamic> toJson(){
    Map<String,dynamic> regMap={
    'name':UserName,
    'email':Email.trim(),
    'password':Pass,
    'c_password':CPass
  };
    return regMap;
  }
}