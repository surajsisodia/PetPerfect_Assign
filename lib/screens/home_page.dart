import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_perfect/bloc/homepage_image_bloc.dart';
import 'package:pet_perfect/screens/post_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<HomepageImageBloc, HomepageImageState>(
        builder: (context, state) {
          if (state is HomePageImageLoadedState)
            return FloatingActionButton(
              onPressed: () {
                HomepageImageBloc()
                    .add(SaveImageEvent(state.imageFile?.path ?? "", context));
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PostScreen()));
              },
              child: const Icon(Icons.arrow_forward_ios_rounded),
            );
          else
            return SizedBox();
        },
      ),
      body: Container(
        child: Center(
          child: BlocBuilder<HomepageImageBloc, HomepageImageState>(
            builder: (context, state) {
              if (state is HomePageImageLoadedState)
                return imageWidget(state, context);
              else if (state is HomepageImageInitial)
                return CircularProgressIndicator();
              else if (state is HomePageImageFailedState)
                return errorWidget(errorMsg: state.errorMessage);
              else
                return errorWidget();
            },
          ),
        ),
      ),
    );
  }

  imageWidget(HomePageImageLoadedState state, BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Image.file(
      state.imageFile ?? File(""),
      height: height / 2,
      errorBuilder: (context, error, stackTrace) {
        return errorWidget();
      },
    );
  }

  errorWidget({String? errorMsg}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error),
        SizedBox(width: 5),
        Text(errorMsg ?? "Error Encountered")
      ],
    );
  }
}
