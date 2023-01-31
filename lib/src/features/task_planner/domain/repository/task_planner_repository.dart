import 'package:dartz/dartz.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';

abstract class TaskPlannerRepository {
  Future<Either<Failure, List<TaskEntity>>> getTasks({String? date});
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, CategoryEntity>> saveCategory(CategoryEntity entity);
  Future<Either<Failure, TaskEntity>> saveTask(TaskEntity entity);
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity entity);
}
