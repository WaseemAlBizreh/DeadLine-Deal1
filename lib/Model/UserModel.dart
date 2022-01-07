class user{
  late String name;
  late String email;
  String? token;

  user({
    required this.name,
    required this.email,
    this.token,
  });
  factory user.fromJson(Map<String, dynamic> jsonData) {
    return user(
      token: jsonData['token'] != null ? jsonData['token'] : "",
      email: jsonData['email'] != null ? jsonData['email'] : "",
      name: jsonData['name'] != null ? jsonData['name'] : "",
    );
  }
}