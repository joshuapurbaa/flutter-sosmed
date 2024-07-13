import 'package:flutter_sosmed/core/utils/utils.dart';

class PostingPostParam {

  PostingPostParam({
    required this.userId,
    required this.title,
    required this.body,
  });
  final int userId;
  final String title;
  final String body;

  MapStringDynamic toJson() {
    return {
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
