import 'package:bloc/bloc.dart';
import 'package:pet_perfect/models/posts.dart';
import 'package:pet_perfect/services/network_services.dart';

part 'post_state.dart';
part 'post_event.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    getPost();
  }

  void getPost() async {
    try {
      final res = await NetworkServices.getPosts();
      emit(PostLoadedState(res));
    } catch (e) {
      print(e);
      emit(PostErrorState(e.toString()));
    }
  }
}
