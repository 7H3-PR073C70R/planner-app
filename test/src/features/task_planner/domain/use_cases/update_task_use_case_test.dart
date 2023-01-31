import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/update_task_use_case.dart';

import '../../../../../utils/mocks.dart';

void main() {
  late final TaskPlannerRepository taskPlannerRepository;
  late final UpdateTaskUseCase updateTaskUseCase;

  setUp(() {
    taskPlannerRepository = TaskPlannerRepositoryMock();
    updateTaskUseCase = UpdateTaskUseCase(taskPlannerRepository);
  });
  group('save task use case ...', () {
    test('verify call to [updateTask] when UpdateTaskUseCase is called',
        () async {
      const task = TaskEntity(
        categoryId: 'categoryId',
        date: 'date',
        name: 'name',
      );
      //! arrange
      when(() => taskPlannerRepository.updateTask(task)).thenAnswer(
        (invocation) async => const Right(
          task,
        ),
      );
      //! act
      await updateTaskUseCase(
        const TaskEntity(
          categoryId: 'categoryId',
          date: 'date',
          name: 'name',
        ),
      );
      //! assert
      verify(
        () => taskPlannerRepository.updateTask(task),
      );
    });
  });
}
