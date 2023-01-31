import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/core/constants/app_api_endpoint.dart';
import 'package:planner_app/src/features/task_planner/data/data_source/task_planner_remote_data_source.dart';
import 'package:planner_app/src/services/api_service.dart';
import 'package:planner_app/src/services/user_service.dart';

import '../../../../../utils/data.dart';

class ApiServiceMock extends Mock implements ApiService {}

void main() {
  late final ApiService apiService;
  late final TaskPlannerRemoteDataSource dataSource;
  late final UserService userService;

  setUpAll(() {
    userService = UserService();
    apiService = ApiServiceMock();
    dataSource = TaskPlannerRemoteDataSourceImpl(
      apiService,
      userService,
    );
  });
  group(
    'task planner remote data source ...',
    () {
      //! get categories
      test(
        'verify that [getCategories] return the right data when api call'
        ' is successful',
        () async {
          //! Arrange
          when(
            () => apiService.get(
              url: AppApiEndpoint.categories,
              headers: userService.header,
              queryParameters: {
                'orderBy': 'name',
              },
            ),
          ).thenAnswer((invocation) async => categoriesJson);
          //! Act
          final result = await dataSource.getCategories();
          //! Assert
          verify(
            () => apiService.get(
              url: AppApiEndpoint.categories,
              headers: userService.header,
              queryParameters: {
                'orderBy': 'name',
              },
            ),
          );
          expect(result.length, 16);
        },
      );

      //! get tasks
      test(
        'verify that [getTasks] return the right data when api call'
        ' is successful',
        () async {
          //! Arrange
          when(
            () => apiService.get(
              url: AppApiEndpoint.task,
              headers: userService.header,
              queryParameters: {
                'orderBy': 'name',
                'date': 'date',
              },
            ),
          ).thenAnswer((invocation) async => tasksJson);
          //! Act
          final result = await dataSource.getTasks(date: 'date');
          //! Assert
          verify(
            () => apiService.get(
              url: AppApiEndpoint.task,
              headers: userService.header,
              queryParameters: {
                'orderBy': 'name',
                'date': 'date',
              },
            ),
          );
          expect(result.length, 20);
        },
      );

      //! save category
      test(
        'verify that [saveCategory] return the right data when api call'
        ' is successful',
        () async {
          //! Arrange
          when(
            () => apiService.post(
              url: AppApiEndpoint.categories,
              headers: userService.header,
              body: category.toJson(),
            ),
          ).thenAnswer((invocation) async => categoryJson);
          //! Act
          final result = await dataSource.saveCategory(category);
          //! Assert
          verify(
            () => apiService.post(
              url: AppApiEndpoint.categories,
              headers: userService.header,
              body: category.toJson(),
            ),
          );
          expect(result, category);
        },
      );

      //! save task
      test(
        'verify that [saveTask] return the right data when api call'
        ' is successful',
        () async {
          //! Arrange
          when(
            () => apiService.post(
              url: AppApiEndpoint.task,
              headers: userService.header,
              body: task.toJson(),
            ),
          ).thenAnswer((invocation) async => taskJson);
          //! Act
          final result = await dataSource.saveTask(task);
          //! Assert
          verify(
            () => apiService.post(
              url: AppApiEndpoint.task,
              headers: userService.header,
              body: task.toJson(),
            ),
          );
          expect(result, task);
        },
      );

      //! save task
      test(
        'verify that [updateTask] return the right data when api call'
        ' is successful',
        () async {
          //! Arrange
          when(
            () => apiService.patch(
              url: AppApiEndpoint.updateTask(task.id!),
              headers: userService.header,
              body: task.toJson(),
            ),
          ).thenAnswer((invocation) async => taskJson);
          //! Act
          final result = await dataSource.updateTask(task);
          //! Assert
          verify(
            () => apiService.patch(
              url:  AppApiEndpoint.updateTask(task.id!),
              headers: userService.header,
              body: task.toJson(),
            ),
          );
          expect(result, task);
        },
      );
    },
  );
}
