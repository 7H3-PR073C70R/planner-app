import 'package:dartz/dartz.dart';
import 'package:planner_app/src/core/error/exceptions.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/features/task_planner/data/data_source/task_planner_remote_data_source.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';

class TaskPlannerRepositoryImpl implements TaskPlannerRepository {
  const TaskPlannerRepositoryImpl(this.dataSource);
  final TaskPlannerRemoteDataSource dataSource;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      return Right(await dataSource.getCategories());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getTasks({String? date}) async {
    try {
      return Right(await dataSource.getTasks(date: date));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CategoryEntity>> saveCategory(
    CategoryEntity entity,
  ) async {
    try {
      return Right(await dataSource.saveCategory(entity));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> saveTask(TaskEntity entity) async {
    try {
      return Right(
        await dataSource.saveTask(entity),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, TaskEntity>> updateTask(TaskEntity entity) async {
    try {
      return Right(
        await dataSource.updateTask(entity),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return const Left(ServerFailure());
    }
  }
}
