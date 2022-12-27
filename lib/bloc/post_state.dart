part of 'post_bloc.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoadedState extends PostState {
  List<Post> posts = [];
  PostLoadedState(this.posts);
}

class PostErrorState extends PostState {
  String? errorMessage;
  PostErrorState(this.errorMessage);
}
