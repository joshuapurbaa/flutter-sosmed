import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/data/datasources/remote/post_api.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/post_repository.dart';
import 'package:flutter_sosmed/features/feeds/models/post.dart';
import 'package:flutter_sosmed/features/feeds/models/posting_param.dart';
import 'package:fpdart/fpdart.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this.postApi);

  final PostApi postApi;
  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    try {
      final result = await postApi.deletePost(id);
      return right(result);
    } on AppException catch (e) {
      return left(
        HttpFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Post>> getPostById(int id) async {
    try {
      final result = await postApi.getPostById(id);
      return right(result);
    } on AppException catch (e) {
      return left(
        HttpFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, List<Post>>> getPosts() async {
    try {
      final result = await postApi.getPosts();
      return right(result);
    } on AppException catch (e) {
      return left(HttpFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> postingPost(PostingPostParam param) async {
    try {
      final result = await postApi.postingPost(param);
      return right(result);
    } on AppException catch (e) {
      return left(
        HttpFailure(e.message),
      );
    }
  }

  @override
  Future<Either<Failure, Post>> updatePost(Post updatedPost) async {
    try {
      final result = await postApi.updatePost(updatedPost);
      return right(result);
    } on AppException catch (e) {
      return left(HttpFailure(e.message));
    }
  }
}
