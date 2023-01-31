import 'package:dartz/dartz.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/core/utils/use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';

class GetCategoriesUseCase implements UseCase<List<CategoryEntity>, NoParam> {
  const GetCategoriesUseCase(this.repository);
  final TaskPlannerRepository repository;

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParam param) {
    return repository.getCategories();
  }
}
