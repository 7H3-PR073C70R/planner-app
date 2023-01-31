import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_tasks_use_case.dart';

import '../../../../../utils/mocks.dart';

void main() {
  late final TaskPlannerRepository taskPlannerRepository;
  late final GetTasksUseCase getTasksUseCase;

  setUp(() {
    taskPlannerRepository = TaskPlannerRepositoryMock();
    getTasksUseCase = GetTasksUseCase(taskPlannerRepository);
  });
  group('get task use case ...', () {
    test('verify call to [gatTasks] when GetTasksUseCase is called', () async {
      //! arrange
      when(taskPlannerRepository.getTasks).thenAnswer(
        (invocation) async => const Right(
          [
            TaskEntity(
              categoryId: 'categoryId',
              date: 'date',
              name: 'name',
            ),
          ],
        ),
      );
      //! act
      await getTasksUseCase(null);
      //! assert
      verify(taskPlannerRepository.getTasks);
    });
  });
}
