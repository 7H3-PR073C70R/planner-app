import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_category_use_case.dart';

import '../../../../../utils/mocks.dart';

void main() {
  late final TaskPlannerRepository taskPlannerRepository;
  late final SaveCategoryUseCase saveCategoryUseCase;

  setUp(() {
    taskPlannerRepository = TaskPlannerRepositoryMock();
    saveCategoryUseCase = SaveCategoryUseCase(taskPlannerRepository);
  });
  group('save category use case ...', () {
    test('verify call to [saveCategory] when SaveCategoryUseCase is called',
        () async {
      const category = CategoryEntity(
        color: 'color',
        name: 'name',
      );
      //! arrange
      when(() => taskPlannerRepository.saveCategory(category)).thenAnswer(
        (invocation) async => const Right(
          category,
        ),
      );
      //! act
      await saveCategoryUseCase(
        const CategoryEntity(
          color: 'color',
          name: 'name',
        ),
      );
      //! assert
      verify(
        () => taskPlannerRepository.saveCategory(category),
      );
    });
  });
}
