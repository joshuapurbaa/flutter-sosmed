import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sosmed/features/feeds/domain/usecases/get_posts.dart';
import 'package:flutter_sosmed/features/feeds/models/models.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc({
    required GetPosts getPost,
  })  : _getPosts = getPost,
        super(FeedInitial()) {
    on<GetListOfPostEvent>(_onGetListOfPostEvent);
  }

  final GetPosts _getPosts;

  Future<void> _onGetListOfPostEvent(
    GetListOfPostEvent event,
    Emitter<FeedState> emit,
  ) async {
    final result = await _getPosts.call();

    result.fold(
      (failure) => emit(
        FeedErrorGetData(failure.message),
      ),
      (posts) => emit(
        FeedHasListData(posts),
      ),
    );
  }
}
