import 'package:flutter/material.dart';
import 'package:flutter_sosmed/features/feeds/models/models.dart';
import 'package:flutter_sosmed/features/feeds/view/widgets/post_item.dart';

class PostListWidget extends StatelessWidget {
  const PostListWidget({required this.posts, super.key});

  final List<Post> posts;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList.separated(
          itemCount: posts.length,
          itemBuilder: (context, index) => PostItem(
            post: posts[index],
          ),
          separatorBuilder: (context, index) => const Divider(),
        ),
      ],
    );
  }
}
