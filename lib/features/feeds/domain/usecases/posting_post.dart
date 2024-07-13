import 'package:flutter_sosmed/core/core.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/repositories.dart';
import 'package:flutter_sosmed/features/feeds/models/posting_param.dart';
import 'package:fpdart/fpdart.dart';

class PostingPost {
  PostingPost(this.postRepository);

  final PostRepository postRepository;

  Future<Either<Failure, Unit>> call(PostingPostParam param) {
    return postRepository.postingPost(param);
  }
}
