import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/post_repository.dart';
import 'package:flutter_sosmed/features/feeds/models/models.dart';
import 'package:fpdart/fpdart.dart';

class UpdatePost {
  UpdatePost(this.postRepository);

  final PostRepository postRepository;

  Future<Either<Failure, Post>> call(Post updatedPost) {
    return postRepository.updatePost(updatedPost);
  }
}
