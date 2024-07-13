import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/models/post.dart';
import 'package:flutter_sosmed/features/feeds/models/posting_param.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts();
  Future<Either<Failure, Post>> getPostById(int id);
  Future<Either<Failure, Unit>> postingPost(PostingPostParam param);
  Future<Either<Failure, Post>> updatePost(Post updatedPost);
  Future<Either<Failure, Unit>> deletePost(int id);
}
