import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_categories_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_tasks_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_category_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_task_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/update_task_use_case.dart';
import 'package:planner_app/src/services/api_service.dart';

final locator = GetIt.instance;

Future<void> init() async {
//!UseCases DI
  locator
    ..registerLazySingleton<GetTasksUseCase>(
      () => GetTasksUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<GetCategoriesUseCase>(
      () => GetCategoriesUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<SaveCategoryUseCase>(
      () => SaveCategoryUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<SaveTaskUseCase>(
      () => SaveTaskUseCase(
        locator(),
      ),
    )
    ..registerLazySingleton<UpdateTaskUseCase>(
      () => UpdateTaskUseCase(
        locator(),
      ),
    )

//!DataSources DI

//!Repositories DI

//!External Services DI
  ..registerLazySingleton<ApiService>(
    () => ApiServiceImpl(Dio()),
  );
}
