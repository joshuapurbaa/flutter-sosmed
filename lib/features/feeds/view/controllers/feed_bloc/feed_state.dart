part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

final class FeedHasListData extends FeedState {
  const FeedHasListData(this.posts);

  final List<Post> posts;
}

final class FeedErrorGetData extends FeedState {
  const FeedErrorGetData(this.message);

  final String message;
}

final class FeedLoading extends FeedState {}
