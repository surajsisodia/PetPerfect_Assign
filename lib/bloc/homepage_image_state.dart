part of 'homepage_image_bloc.dart';

abstract class HomepageImageState {}

class HomepageImageInitial extends HomepageImageState {}

class HomePageImageLoadedState extends HomepageImageState {
  File? imageFile;

  HomePageImageLoadedState(this.imageFile);
}

class HomePageImageFailedState extends HomepageImageState {
  String? errorMessage;

  HomePageImageFailedState(this.errorMessage);
}
