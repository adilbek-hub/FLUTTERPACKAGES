import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_api_plaseholder/bloc/post_bloc.dart';
import 'package:get_it_api_plaseholder/widgets.dart/sliver_grid_info.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<PostBloc, PostState>(builder: (context, state) {
      if (state is PostLoading) {
        return Center(child: state.child);
      } else if (state is PostLoaded) {
        return RefreshIndicator.adaptive(
          onRefresh: () async {
            context.read<PostBloc>().add(PostFetched());
          },
          child: CustomScrollView(
            slivers: [
              const SliverAppBar.medium(
                title: Text('Hello'),
              ),
              SliverGridInfo(
                postLoaded:
                    PostLoaded(placeholderModel: state.placeholderModel),
              ),
            ],
          ),
        );
      } else if (state is PostError) {
        return Center(child: Text(state.errorMessage));
      } else {
        return const Text('Unknown state');
      }
    }));
  }
}
