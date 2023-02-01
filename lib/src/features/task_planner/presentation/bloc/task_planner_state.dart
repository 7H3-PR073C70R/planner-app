part of 'task_planner_bloc.dart';

class TaskPlannerState extends Equatable {
  const TaskPlannerState({
    required this.categories,
    required this.tasks,
    required this.viewState,
    required this.errorMessage,
  });

  factory TaskPlannerState.initial() => const TaskPlannerState(
        categories: [],
        tasks: [],
        viewState: ViewState.idle,
        errorMessage: null,
      );

  final ViewState viewState;
  final List<CategoryEntity> categories;
  final List<TaskEntity> tasks;
  final String? errorMessage;

  TaskPlannerState copyWith({
    ViewState? viewState,
    List<CategoryEntity>? categories,
    List<TaskEntity>? tasks,
    String? errorMessage,
  }) =>
      TaskPlannerState(
        categories: categories ?? this.categories,
        tasks: tasks ?? this.tasks,
        viewState: viewState ?? this.viewState,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [
        viewState,
        categories,
        tasks,
      ];
}
