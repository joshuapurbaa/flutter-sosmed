import 'package:equatable/equatable.dart';
import 'package:flutter_sosmed/core/core.dart';

class Post extends Equatable {
  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(MapStringDynamic json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
  final int userId;
  final int id;
  final String title;
  final String body;

  MapStringDynamic toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        userId,
        title,
        body,
      ];
}
