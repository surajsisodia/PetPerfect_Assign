import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/bloc/post_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            if (state is PostInitial) return CircularProgressIndicator();
            if (state is PostLoadedState)
              return buildPostList(state);
            else
              return Text("Error");
          },
        ),
      ),
    );
  }

  ListView buildPostList(PostLoadedState state) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: state.posts.length,
      itemBuilder: ((context, index) {
        final post = state.posts[index];
        return ListTile(
          title: Text(post.title ?? " "),
          subtitle: Text(post.body ?? ""),
        );
      }),
      separatorBuilder: (context, index) {
        return Divider();
      },
    );
  }
}
