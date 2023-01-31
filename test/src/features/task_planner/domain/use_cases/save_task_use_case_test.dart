import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_task_use_case.dart';

import '../../../../../utils/mocks.dart';

void main() {
  late final TaskPlannerRepository taskPlannerRepository;
  late final SaveTaskUseCase saveTaskUseCase;

  setUp(() {
    taskPlannerRepository = TaskPlannerRepositoryMock();
    saveTaskUseCase = SaveTaskUseCase(taskPlannerRepository);
  });
  group('save task use case ...', () {
    test('verify call to [saveTask] when SaveTaskUseCase is called', () async {
      const task = TaskEntity(
        categoryId: 'categoryId',
        date: 'date',
        name: 'name',
      );
      //! arrange
      when(() => taskPlannerRepository.saveTask(task)).thenAnswer(
        (invocation) async => const Right(
          task,
        ),
      );
      //! act
      await saveTaskUseCase(
        const TaskEntity(
          categoryId: 'categoryId',
          date: 'date',
          name: 'name',
        ),
      );
      //! assert
      verify(
        () => taskPlannerRepository.saveTask(task),
      );
    });
  });
}
