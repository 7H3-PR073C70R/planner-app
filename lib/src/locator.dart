import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:planner_app/src/features/task_planner/data/data_source/task_planner_remote_data_source.dart';
import 'package:planner_app/src/features/task_planner/data/repository/task_planner_repository_impl.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_categories_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_tasks_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_category_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_task_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/update_task_use_case.dart';
import 'package:planner_app/src/services/api_service.dart';
import 'package:planner_app/src/services/user_service.dart';

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
..registerLazySingleton<TaskPlannerRemoteDataSource>(
      () => TaskPlannerRemoteDataSourceImpl(
        locator(),
        UserService(),
      ),
    )

//!Repositories DI
..registerLazySingleton<TaskPlannerRepository>(
      () => TaskPlannerRepositoryImpl(
        locator(),
      ),
    )

//!External Services DI
  ..registerLazySingleton<ApiService>(
    () => ApiServiceImpl(Dio()),
  );
}
