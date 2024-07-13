import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sosmed/features/feeds/view/controllers/feed_bloc/feed_bloc.dart';
import 'package:flutter_sosmed/features/feeds/view/widgets/post_list_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  void _getPosts() {
    context.read<FeedBloc>().add(GetListOfPostEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feed'),
        centerTitle: true,
      ),
      body: BlocBuilder<FeedBloc, FeedState>(
        builder: (context, state) {
          switch (state) {
            case FeedLoading():
            case FeedInitial():
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            case FeedErrorGetData():
              return Center(
                child: Text(state.message),
              );
            case FeedHasListData():
              return PostListWidget(
                posts: state.posts,
              );
            default:
              return const Center(
                child: Text('Terjadi kesalahan'),
              );
          }
        },
      ),
    );
  }
}
