import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pet_perfect/bloc/homepage_image_bloc.dart';
import 'package:pet_perfect/bloc/post_bloc.dart';
import 'package:pet_perfect/screens/home_page.dart';

void main() async {
  await Hive.initFlutter();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomepageImageBloc>(create: (_) => HomepageImageBloc()),
        BlocProvider<PostBloc>(create: (_) => PostBloc())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PetPerfect Assign',
        home: HomePage(),
      ),
    );
  }
}
