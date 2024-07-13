import 'dart:convert';

import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/models/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;

abstract interface class PostApi {
  Future<List<Post>> getPosts();
  Future<Post> getPostById(int id);
  Future<Unit> postingPost(PostingPostParam param);
  Future<Post> updatePost(Post updatedPost);
  Future<Unit> deletePost(int id);
}

class PostApiImpl implements PostApi {
  PostApiImpl({required this.client});
  final http.Client client;

  @override
  Future<Unit> deletePost(int id) async {
    try {
      final url = uriParse('${JsonPlaceholder.baseUrl}/posts');
      final response = await client.delete(
        url,
      );

      if (response.statusCode == 200) {
        print('response :: ${response.body}');
        return unit;
      } else {
        throw AppException(
          'Gagal menghapus post',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw AppException(
        'Gagal menghapus post $e',
      );
    }
  }

  @override
  Future<Post> getPostById(int id) async {
    try {
      final url = uriParse('${JsonPlaceholder.baseUrl}/posts/$id');
      final response = await client.get(url);

      if (response.statusCode == 200) {
        final post = Post.fromJson(
          jsonDecode(response.body) as MapStringDynamic,
        );

        return post;
      } else {
        throw AppException(
          'Gagal mendapatkan post',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw AppException(
        'Gagal mendapatkan post $e',
      );
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    try {
      final url = uriParse('${JsonPlaceholder.baseUrl}/posts');
      final response = await client.get(url);
      final posts = <Post>[];

      if (response.statusCode == 200) {
        final rawPosts = jsonDecode(response.body);

        print('raw post :: ${rawPosts.runtimeType}');

        if (rawPosts is List) {
          for (final post in rawPosts) {
            if (post is MapStringDynamic) {
              posts.add(Post.fromJson(post));
            }
          }
        }

        return posts;
      } else {
        throw AppException(
          'Gagal mendapatkan daftar post',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw AppException(
        'Gagal mendapatkan daftar post $e',
      );
    }
  }

  @override
  Future<Unit> postingPost(PostingPostParam param) async {
    try {
      final url = uriParse('${JsonPlaceholder.baseUrl}/posts');
      final body = param.toJson();
      final response = await client.post(
        url,
        body: body,
      );

      if (response.statusCode == 201) {
        return unit;
      } else {
        throw AppException(
          'Gagal melakukan post',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw AppException(
        'Gagal melakukan post $e',
      );
    }
  }

  @override
  Future<Post> updatePost(Post updatedPost) async {
    try {
      final url =
          uriParse('${JsonPlaceholder.baseUrl}/posts/${updatedPost.id}');
      final body = updatedPost.toJson();
      final response = await client.put(
        url,
        body: body,
      );

      if (response.statusCode == 200) {
        final rawPost = jsonDecode(response.body);
        if (rawPost is MapStringDynamic) {
          final post = Post.fromJson(
            jsonDecode(response.body) as MapStringDynamic,
          );

          return post;
        } else {
          throw AppException(
            'Gagal mengubah post',
            statusCode: 200,
          );
        }
      } else {
        throw AppException(
          'Gagal mengubah post',
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      throw AppException(
        'Gagal mengubah post $e',
      );
    }
  }
}
