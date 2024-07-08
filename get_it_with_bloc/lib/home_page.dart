import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it_with_bloc/bloc/person_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    context.read<PersonBloc>().add(const GetPerson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PersonBloc, PersonState>(
        builder: (context, state) {
          if (state is PersonLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PersonSuccess) {
            return ListView.builder(
                itemCount: state.persons.length,
                itemBuilder: (context, index) {
                  final person = state.persons[index];
                  return ListTile(
                    title: Text(person.name),
                    subtitle: Text(person.city),
                    trailing: Text('Age:${person.age}'),
                  );
                });
          } else if (state is PersonError) {
            return const Center(child: Text("Error"));
          } else {
            return const Center(child: Text("Error"));
          }
        },
      ),
    );
  }
}
