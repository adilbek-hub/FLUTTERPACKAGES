import 'package:flutter/material.dart';
import 'package:get_it_api_plaseholder/api_service.dart';
import 'package:get_it_api_plaseholder/main.dart';
import 'package:get_it_api_plaseholder/model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List<PlaceholderModel>? placeholderModel;
  late Future<List<PlaceholderModel>?> _placeholder;
  final ApiService _apiService = getIt<ApiService>();

  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //   ApiService().fetchData().then((value) {
  //     setState(() {
  //       placeholderMode = value;
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();
    _placeholder = _apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PlaceholderModel>?>(
          future: _placeholder,
          builder: (context, sn) {
            if (sn.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (sn.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else {
              return CustomScrollView(
                slivers: [
                  const SliverAppBar.medium(
                    title: Text('Hello'),
                  ),
                  SliverGrid.builder(
                    itemCount: sn.data!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 5 / 9.5,
                    ),
                    itemBuilder: (context, index) {
                      final snapshot = sn.data![index];
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
                  )
                ],
              );
            }
          }),
    );
  }
}
