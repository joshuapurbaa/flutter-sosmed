import 'package:flutter_sosmed/features/feeds/data/datasources/remote/post_api.dart';
import 'package:flutter_sosmed/features/feeds/data/repositories_impl/post_repository_impl.dart';
import 'package:flutter_sosmed/features/feeds/domain/repositories/post_repository.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/delete_post.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/get_post_by_id.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/get_posts.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/posting_post.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/update_post.dart';
import 'package:flutter_sosmed/features/feeds/view/controllers/feed_bloc/feed_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  serviceLocator.registerLazySingleton<Client>(
    http.Client.new,
  );

  initPost();
}

void initPost() {
  serviceLocator
    ..registerFactory<PostApi>(
      () => PostApiImpl(
        client: serviceLocator(),
      ),
    )
    ..registerFactory<PostRepository>(
      () => PostRepositoryImpl(
        serviceLocator(),
      ),
    )
    ..registerFactory(
      () => GetPosts(serviceLocator()),
    )
    ..registerFactory(
      () => GetPostById(serviceLocator()),
    )
    ..registerFactory(
      () => UpdatePost(serviceLocator()),
    )
    ..registerFactory(
      () => DeletePost(serviceLocator()),
    )
    ..registerFactory(
      () => PostingPost(serviceLocator()),
    )
    ..registerLazySingleton<FeedBloc>(
      () => FeedBloc(
        getPost: serviceLocator(),
      ),
    );
}
