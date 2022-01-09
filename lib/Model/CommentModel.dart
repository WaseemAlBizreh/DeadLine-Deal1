import 'UserModel.dart';

class ReqComment {
  late String title;
  ReqComment({
    required this.title,
  });

  Map<String, String> toJson() {
    Map<String, String> Comment = {
      'title': title,
    };
    return Comment;
  }
}

class ResComment {
  late user User;
  late String title;

  ResComment({
    required this.User,
    required this.title,
  });
  factory ResComment.fromJson(Map<String, dynamic> jsonData) {
    return ResComment(
      User: jsonData['user'] != null ? jsonData['user'] : "",
      title: jsonData['title'] != null ? jsonData['title'] : "",
    );
  }
}

class comment_list {
  late List<dynamic> com_list;

  comment_list({required this.com_list});

  factory comment_list.fromJson(jsonData) {
    return comment_list(
      com_list: jsonData,
    );
  }
}