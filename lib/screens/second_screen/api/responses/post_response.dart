import 'package:equatable/equatable.dart';

class PostResponse extends Equatable{
  late int userId;
  late int id;
  late String title;
  late String body;
  PostResponse({required this.userId, required this.id, required this.title, required this.body});

  PostResponse.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }

  @override
  List<Object?> get props => [userId,id,title,body];
}