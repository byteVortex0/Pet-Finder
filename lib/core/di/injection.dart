import 'package:get_it/get_it.dart';

import '../service/api/api_service.dart';

import '../service/api/dio_factory.dart';

GetIt sl = GetIt.instance;

void setupInjection() {
  _initCore();
}

void _initCore() {
  final dio = DioFactory.getDio();
  sl.registerLazySingleton<ApiService>(() => ApiService(dio));
}
