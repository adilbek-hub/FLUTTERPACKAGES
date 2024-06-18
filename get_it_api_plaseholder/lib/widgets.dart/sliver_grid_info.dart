import 'package:flutter/material.dart';
import 'package:get_it_api_plaseholder/bloc/post_bloc.dart';

class SliverGridInfo extends StatelessWidget {
  const SliverGridInfo({
    super.key,
    required this.postLoaded,
  });
  final PostLoaded postLoaded;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: postLoaded.placeholderModel!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 5 / 9.5,
      ),
      itemBuilder: (context, index) {
        final snapshot = postLoaded.placeholderModel![index];
        return Card(
          color: Colors.grey,
          child: ListTile(
            title: Text(
              snapshot.title ?? '',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            subtitle: Text(snapshot.body ?? ''),
          ),
        );
      },
    );
  }
}
