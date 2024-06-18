import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_api_plaseholder/bloc/post_bloc.dart';
import 'package:get_it_api_plaseholder/my_home_page.dart';
import 'package:get_it_api_plaseholder/service_locator.dart';

void main() {
  ServiceLocator.setUp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
            create: (context) => PostBloc()..add(PostFetched())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
