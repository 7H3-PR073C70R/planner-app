import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/core/utils/use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_categories_use_case.dart';

import '../../../../../utils/mocks.dart';

void main() {
  late final TaskPlannerRepository taskPlannerRepository;
  late final GetCategoriesUseCase getCategoriesUseCase;

  setUp(() {
    taskPlannerRepository = TaskPlannerRepositoryMock();
    getCategoriesUseCase = GetCategoriesUseCase(taskPlannerRepository);
  });
  group('get categories use case ...', () {
    test('verify call to [getCategories] when GetCategoriesUseCase is called',
        () async {
      //! arrange
      when(taskPlannerRepository.getCategories).thenAnswer(
        (invocation) async => const Right(
          [
            CategoryEntity(
              name: 'name',
              color: '#color',
            ),
          ],
        ),
      );
      //! act
      await getCategoriesUseCase(NoParam());
      //! assert
      verify(taskPlannerRepository.getCategories);
    });
  });
}
