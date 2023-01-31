import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:planner_app/src/services/api_service.dart';

final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI

//!DataSources DI

//!Repositories DI

//!External Services DI
  locator.registerLazySingleton<ApiService>(
    () => ApiServiceImpl(Dio()),
  );
}
