import 'package:get_it/get_it.dart';
import 'package:get_it_api_plaseholder/api_service.dart';

class ServiceLocator {
  static void setUp() {
    //Services
    GetIt.I.registerLazySingleton(() => apiService);
  }
}

final serviceLocator = ServiceLocator();
