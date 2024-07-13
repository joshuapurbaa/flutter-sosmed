import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/repositories.dart';
import 'package:flutter_sosmed/features/feeds/models/post.dart';
import 'package:fpdart/fpdart.dart';

class GetPosts {
  GetPosts(this.postRepository);

  final PostRepository postRepository;

  Future<Either<Failure, List<Post>>> call() {
    return postRepository.getPosts();
  }
}
