import 'package:get_it/get_it.dart';
import 'package:get_it_with_bloc/bloc/person_bloc.dart';
import 'package:get_it_with_bloc/model.dart';

class ServiceLocator {
  ServiceLocator._();
  static final instance = ServiceLocator._();
  GetIt getIt = GetIt.instance;

  void setUp() {
    getIt.registerLazySingleton<PersonBloc>(() => PersonBloc(person: persons));
  }
}
