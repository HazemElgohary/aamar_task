import 'package:equatable/equatable.dart';

class PostModel extends Equatable {
  static const tableName = 'posts';
  final int userId;
  final int id;
  final String title;
  final String body;

  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "userId": userId,
      "title": title,
      "body": body,
    };
  }

  @override
  List<Object?> get props => [
        userId,
        id,
        title,
        body,
      ];

  static const createStatement = """  CREATE TABLE "posts" (
                      "id"	INTEGER,
                      "userId"	INTEGER,
                      "title"	VARCHAR,
                      "body"	VARCHAR,
                      PRIMARY KEY("id")
                      );""";
}
