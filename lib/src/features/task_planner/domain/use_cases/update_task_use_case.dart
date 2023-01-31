import 'package:dartz/dartz.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/core/utils/use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/repository/task_planner_repository.dart';

class UpdateTaskUseCase implements UseCase<TaskEntity, TaskEntity> {
  const UpdateTaskUseCase(this.repository);
  final TaskPlannerRepository repository;

  @override
  Future<Either<Failure, TaskEntity>> call(TaskEntity param) {
    return repository.updateTask(param);
  }
}
