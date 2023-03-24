import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';
import '../widgets/bottom_loader.dart';
import '../widgets/post_list_item.dart';

class PostsList extends StatelessWidget {
  final ScrollController _scrollController;

  const PostsList(this._scrollController, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state.status == PostStatus.failure) {
          return const Center(child: Text('failed to fetch posts'));
        } else if (state.status == PostStatus.success) {
          if (state.posts.isEmpty) {
            return const Center(child: Text('no posts'));
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            controller: _scrollController,
            itemCount: state.hasReachedMax
                ? state.posts.length
                : state.posts.length + 1,
            itemBuilder: (BuildContext context, int index) {
              return index >= state.posts.length
                  ? const BottomLoader()
                  : PostListItem(state.posts[index]);
            },
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
