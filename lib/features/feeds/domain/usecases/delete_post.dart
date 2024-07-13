import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/post_repository.dart';
import 'package:fpdart/fpdart.dart';

class DeletePost {
  DeletePost(this.postRepository);

  final PostRepository postRepository;

  Future<Either<Failure, Unit>> call(int id) {
    return postRepository.deletePost(id);
  }
}
