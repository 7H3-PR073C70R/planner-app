import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/core/error/exceptions.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/features/task_planner/data/data_source/task_planner_remote_data_source.dart';
import 'package:planner_app/src/features/task_planner/data/repository/task_planner_repository_impl.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';

class TaskPlannerRemoteDataSourceMock extends Mock
    implements TaskPlannerRemoteDataSource {}

void main() {
  late final TaskPlannerRemoteDataSource remoteDataSource;
  late final TaskPlannerRepository repository;

  const category = CategoryEntity(
    color: 'color',
    name: 'name',
  );

  const taskEntity = TaskEntity(
    categoryId: 'categoryId',
    date: 'date',
    name: 'name',
  );

  setUpAll(() {
    remoteDataSource = TaskPlannerRemoteDataSourceMock();
    repository = TaskPlannerRepositoryImpl(remoteDataSource);
  });
  group('task planner repository impl ...', () {

    //! Get Categories
    group('get categories', () {
      test(
        'verify that when [getCategories] return data the right side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(remoteDataSource.getCategories).thenAnswer(
            (invocation) async => const [category],
          );
          //! Act
          final result = await repository.getCategories();
          //! Assert
          verify(remoteDataSource.getCategories);
          expect(
            result,
            const Right<Failure, List<CategoryEntity>>(
              [category],
            ),
          );
        },
      );

      test(
        'verify that when [getCategories] return error the left side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(remoteDataSource.getCategories).thenAnswer(
            (invocation) async => throw const ServerException(),
          );
          //! Act
          final result = await repository.getCategories();
          //! Assert
          verify(remoteDataSource.getCategories);
          expect(
            result,
            const Left<Failure, List<CategoryEntity>>(
              ServerFailure(),
            ),
          );
        },
      );
    });


    //! Get Tasks
    group('get tasks', () {
      test(
        'verify that when [getTasks] return data the right side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(remoteDataSource.getTasks).thenAnswer(
            (invocation) async => const [taskEntity],
          );
          //! Act
          final result = await repository.getTasks();
          //! Assert
          verify(remoteDataSource.getTasks);
          expect(
            result,
            const Right<Failure, List<TaskEntity>>(
              [taskEntity],
            ),
          );
        },
      );

      test(
        'verify that when [getTasks] return error the left side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(remoteDataSource.getTasks).thenAnswer(
            (invocation) async => throw const ServerException(),
          );
          //! Act
          final result = await repository.getTasks();
          //! Assert
          verify(remoteDataSource.getTasks);
          expect(
            result,
            const Left<Failure, List<TaskEntity>>(
              ServerFailure(),
            ),
          );
        },
      );
    });

    //! Save Task
    group('save tasks', () {
      test(
        'verify that when [saveTask] return data the right side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.saveTask(taskEntity)).thenAnswer(
            (invocation) async => taskEntity,
          );
          //! Act
          final result = await repository.saveTask(taskEntity);
          //! Assert
          verify(() => remoteDataSource.saveTask(taskEntity));
          expect(
            result,
            const Right<Failure, TaskEntity>(
              taskEntity,
            ),
          );
        },
      );

      test(
        'verify that when [saveTask] return error the left side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.saveTask(taskEntity)).thenAnswer(
            (invocation) async => throw const ServerException(),
          );
          //! Act
          final result = await repository.saveTask(taskEntity);
          //! Assert
          verify(() => remoteDataSource.saveTask(taskEntity));
          expect(
            result,
            const Left<Failure, TaskEntity>(
              ServerFailure(),
            ),
          );
        },
      );
    });

    //! Save Category
    group('save category', () {
      test(
        'verify that when [saveCategory] return data the right side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.saveCategory(category)).thenAnswer(
            (invocation) async => category,
          );
          //! Act
          final result = await repository.saveCategory(category);
          //! Assert
          verify(() => remoteDataSource.saveCategory(category));
          expect(
            result,
            const Right<Failure, CategoryEntity>(
              category,
            ),
          );
        },
      );

      test(
        'verify that when [saveCategory] return error the left side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.saveCategory(category)).thenAnswer(
            (invocation) async => throw const ServerException(),
          );
          //! Act
          final result = await repository.saveCategory(category);
          //! Assert
          verify(() => remoteDataSource.saveCategory(category));
          expect(
            result,
            const Left<Failure, CategoryEntity>(
              ServerFailure(),
            ),
          );
        },
      );
    });

    //! Update Task
    group('update tasks', () {
      test(
        'verify that when [updateTask] return data the right side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.updateTask(taskEntity)).thenAnswer(
            (invocation) async => taskEntity,
          );
          //! Act
          final result = await repository.updateTask(taskEntity);
          //! Assert
          verify(() => remoteDataSource.updateTask(taskEntity));
          expect(
            result,
            const Right<Failure, TaskEntity>(
              taskEntity,
            ),
          );
        },
      );

      test(
        'verify that when [saveTask] return error the left side of'
        ' either should be returned',
        () async {
          //! Arrange
          when(() => remoteDataSource.updateTask(taskEntity)).thenAnswer(
            (invocation) async => throw const ServerException(),
          );
          //! Act
          final result = await repository.updateTask(taskEntity);
          //! Assert
          verify(() => remoteDataSource.updateTask(taskEntity));
          expect(
            result,
            const Left<Failure, TaskEntity>(
              ServerFailure(),
            ),
          );
        },
      );
    });
  });
}
