import 'package:flutter_sosmed/features/feeds/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Post Model', () {
    final json = {
      'userId': 1,
      'id': 1,
      'title': 'Test title',
      'body': 'Test Body',
    };
    test(
      'fromJson should return a valid Post Model',
      () {
        final post = Post.fromJson(json);

        expect(post.userId, 1);
        expect(post.id, 1);
        expect(post.title, 'Test title');
        expect(post.body, 'Test Body');
      },
    );

    test('toJson should return a valid map', () {
      final post = Post.fromJson(json);
      final postJson = post.toJson();

      expect(postJson, json);
    });

    test('copyWith should return a copy with updated values', () {
      final post = Post.fromJson(json);

      final updatedPost = post.copyWith(
        id: 2,
        userId: 2,
        title: 'Updated title',
        body: 'Updated body',
      );

      expect(updatedPost.id, 2);
      expect(updatedPost.userId, 2);
      expect(updatedPost.title, 'Updated title');
      expect(updatedPost.body, 'Updated body');
    });

    test(
        'copyWith should return a copy with same values if no parameter are passed',
        () {
      final post = Post.fromJson(json);
      final updatedPost = post.copyWith();

      expect(updatedPost, post);
    });
  });
}
