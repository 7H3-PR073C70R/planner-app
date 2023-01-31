import 'package:planner_app/src/core/constants/app_api_endpoint.dart';
import 'package:planner_app/src/features/task_planner/data/model/category_model.dart';
import 'package:planner_app/src/features/task_planner/data/model/task_model.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/services/api_service.dart';
import 'package:planner_app/src/services/user_service.dart';

abstract class TaskPlannerRemoteDataSource {
  Future<List<TaskEntity>> getTasks({String? date});
  Future<List<CategoryEntity>> getCategories();
  Future<CategoryEntity> saveCategory(CategoryEntity entity);
  Future<TaskEntity> saveTask(TaskEntity entity);
  Future<TaskEntity> updateTask(TaskEntity entity);
}

class TaskPlannerRemoteDataSourceImpl implements TaskPlannerRemoteDataSource {
  const TaskPlannerRemoteDataSourceImpl(
    this._apiService,
    this._userService,
  );
  final ApiService _apiService;
  final UserService _userService;

  @override
  Future<List<CategoryEntity>> getCategories() async {
    final result = await _apiService.get(
      url: AppApiEndpoint.categories,
      headers: _userService.header,
      queryParameters: {
        'orderBy': 'name',
      },
    );
    final resultList = result['documents'] as List<Map<String, dynamic>>;
    return List<Map<String, dynamic>>.from(resultList)
        .map(CategoryModel.fromJson)
        .toList();
  }

  @override
  Future<List<TaskEntity>> getTasks({String? date}) async {
    final result = await _apiService.get(
      url: AppApiEndpoint.task,
      headers: _userService.header,
      queryParameters: {
        'orderBy': 'name',
        'date': date,
      },
    );

    final resultList = result['documents'] as List<Map<String, dynamic>>;
    return List<Map<String, dynamic>>.from(resultList)
        .map(TaskModel.fromJson)
        .toList();
  }

  @override
  Future<CategoryEntity> saveCategory(CategoryEntity entity) async {
    final result = await _apiService.post(
      url: AppApiEndpoint.categories,
      headers: _userService.header,
      body: CategoryModel.fromEntity(entity).toJson(),
    );
    return CategoryModel.fromJson(result);
  }

  @override
  Future<TaskEntity> saveTask(TaskEntity entity) async {
    final result = await _apiService.post(
      url: AppApiEndpoint.task,
      headers: _userService.header,
      body: TaskModel.fromEntity(entity).toJson(),
    );
    return TaskModel.fromJson(result);
  }

  @override
  Future<TaskEntity> updateTask(TaskEntity entity) async {
    final result = await _apiService.patch(
      headers: _userService.header,
      url: AppApiEndpoint.updateTask(entity.id!),
      body: TaskModel.fromEntity(entity).toJson(),
    );
    return TaskModel.fromJson(result);
  }
}
