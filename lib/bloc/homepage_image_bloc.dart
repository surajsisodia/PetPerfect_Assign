import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pet_perfect/services/db_services.dart';
import 'package:pet_perfect/services/network_services.dart';

part 'homepage_image_event.dart';
part 'homepage_image_state.dart';

class HomepageImageBloc extends Bloc<HomepageImageEvent, HomepageImageState> {
  File? imageFile;
  HomepageImageBloc() : super(HomepageImageInitial()) {
    on<SaveImageEvent>((event, emit) => null);
    getImage();
  }

  void getImage() async {
    try {
      imageFile = await NetworkServices.getImages();

      emit(HomePageImageLoadedState(imageFile));
    } catch (e) {
      print(e);
      emit(HomePageImageFailedState(e.toString()));
    }
  }
}
