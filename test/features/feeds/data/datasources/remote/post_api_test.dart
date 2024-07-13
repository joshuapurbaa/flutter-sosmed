import 'dart:convert';

import 'package:flutter_sosmed/features/feeds/data/datasources/remote/post_api.dart';
import 'package:flutter_sosmed/features/feeds/models/post.dart';
import 'package:flutter_sosmed/features/feeds/models/posting_param.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import '../../../../../mocks.mocks.dart';

void main() {
  late MockClient mockClient;
  late PostApiImpl postApiImpl;

  setUp(() {
    mockClient = MockClient();
    postApiImpl = PostApiImpl(client: mockClient);
  });

  group('PostApiImpl', () {
    const post = Post(
      userId: 1,
      id: 1,
      title: 'title',
      body: 'body',
    );

    test(
        'getPosts returns a list of posts if the http call completes successfully',
        () async {
      when(mockClient.get(any)).thenAnswer(
        (_) async => http.Response(
          jsonEncode([post.toJson()]),
          200,
        ),
      );

      final result = await postApiImpl.getPosts();

      expect(result, isA<List<Post>>());
      expect(result.length, 1);
      expect(result.first, post);
    });

    test(
      'getPostById returns a post if the http call completes successfully',
      () async {
        when(mockClient.get(any)).thenAnswer(
          (_) async => http.Response(
            jsonEncode(post.toJson()),
            200,
          ),
        );

        final result = await postApiImpl.getPostById(1);

        expect(result, isA<Post>());
        expect(result.id, 1);
      },
    );

    test(
      'deletePost returns unit if the http call completes successfully ',
      () async {
        when(mockClient.delete(any)).thenAnswer(
          (_) async => http.Response(jsonEncode({}), 200),
        );

        final result = await postApiImpl.deletePost(1);

        expect(result, unit);
      },
    );

    test(
      'postingPost returns unit if the http call completes successfully',
      () async {
        final param = PostingPostParam(
          userId: 1,
          title: 'Title',
          body: 'Body',
        );

        when(mockClient.post(any, body: anyNamed('body'))).thenAnswer(
          (_) async => http.Response('', 201),
        );

        final result = await postApiImpl.postingPost(param);

        expect(result, unit);
      },
    );

    test(
      'updatePost returns updated post if the http call completes successfully',
      () async {
        const updatedPost = Post(
          userId: 2,
          id: 2,
          title: 'Update title',
          body: 'Update body',
        );

        when(
          mockClient.put(any, body: anyNamed('body')),
        ).thenAnswer(
          (_) async => http.Response(
            jsonEncode(updatedPost.toJson()),
            200,
          ),
        );

        final result = await postApiImpl.updatePost(updatedPost);

        expect(result, updatedPost);
        expect(result.userId, 2);
        expect(result.id, 2);
        expect(result.title, 'Update title');
        expect(result.body, 'Update body');
      },
    );
  });
}
