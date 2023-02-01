part of 'task_planner_bloc.dart';

abstract class TaskPlannerEvent extends Equatable {
  const TaskPlannerEvent();
  @override
  List<Object?> get props => [];
}

class InitEvent extends TaskPlannerEvent {
  const InitEvent();
}

class SaveCategoryEvent extends TaskPlannerEvent {
  const SaveCategoryEvent(this.categoryEntity);
  final CategoryEntity categoryEntity;

  @override
  List<Object?> get props => [categoryEntity];
}

class SaveTaskEvent extends TaskPlannerEvent {
  const SaveTaskEvent(this.taskEntity);
  final TaskEntity taskEntity;

  @override
  List<Object?> get props => [taskEntity];
}

class UpdateTaskEvent extends TaskPlannerEvent {
  const UpdateTaskEvent(this.taskEntity);
  final TaskEntity taskEntity;

  @override
  List<Object?> get props => [taskEntity];
}

class FilterTaskByDateEvent extends TaskPlannerEvent {
  const FilterTaskByDateEvent(this.date);
  final String date;

  @override
  List<Object?> get props => [date];
}
