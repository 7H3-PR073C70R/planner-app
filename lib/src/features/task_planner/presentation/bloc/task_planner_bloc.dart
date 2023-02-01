import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:planner_app/src/core/enums/enums.dart';
import 'package:planner_app/src/core/utils/use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_categories_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_tasks_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_category_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_task_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/update_task_use_case.dart';

part 'task_planner_event.dart';
part 'task_planner_state.dart';

class TaskPlannerBloc extends Bloc<TaskPlannerEvent, TaskPlannerState> {
  TaskPlannerBloc({
    required this.getCategoriesUseCase,
    required this.getTasksUseCase,
    required this.updateTaskUseCase,
    required this.saveTaskUseCase,
    required this.saveCategoryUseCase,
  }) : super(TaskPlannerState.initial()) {
    on<InitEvent>(_onInitEvent);
    on<SaveCategoryEvent>(_onSaveCategoryEvent);
    on<SaveTaskEvent>(_onSaveTaskEvent);
    on<UpdateTaskEvent>(_onUpdateTaskEvent);
    on<FilterTaskByDateEvent>(_onFilterTaskByDateEvent);
  }

  final GetCategoriesUseCase getCategoriesUseCase;
  final GetTasksUseCase getTasksUseCase;
  final UpdateTaskUseCase updateTaskUseCase;
  final SaveTaskUseCase saveTaskUseCase;
  final SaveCategoryUseCase saveCategoryUseCase;

  FutureOr<void> _onInitEvent(
    InitEvent event,
    Emitter<TaskPlannerState> emit,
  ) async {
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    final categoriesResult = await getCategoriesUseCase(NoParam());
    categoriesResult.fold(
      (l) => null,
      (categories) => emit(
        state.copyWith(
          categories: categories,
        ),
      ),
    );
    final taskResult = await getTasksUseCase(null);
    taskResult.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (tasks) => emit(
        state.copyWith(
          tasks: tasks,
          viewState: ViewState.success,
        ),
      ),
    );

    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onSaveCategoryEvent(
    SaveCategoryEvent event,
    Emitter<TaskPlannerState> emit,
  ) async {
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    final categoryResult = await saveCategoryUseCase(event.categoryEntity);
    categoryResult.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (category) => emit(
        state.copyWith(
          categories: [
            ...state.categories,
            category,
          ],
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onSaveTaskEvent(
    SaveTaskEvent event,
    Emitter<TaskPlannerState> emit,
  ) async {
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    final taskResult = await saveTaskUseCase(event.taskEntity);
    taskResult.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (task) => emit(
        state.copyWith(
          tasks: [
            ...state.tasks,
            task,
          ],
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onUpdateTaskEvent(
    UpdateTaskEvent event,
    Emitter<TaskPlannerState> emit,
  ) async {
    final tasks = state.tasks;
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    final taskResult = await updateTaskUseCase(event.taskEntity);
    tasks[tasks.indexWhere(
      (element) => element.id == event.taskEntity.id,
    )] = event.taskEntity;
    taskResult.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (task) => emit(
        state.copyWith(
          tasks: [...tasks],
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }

  FutureOr<void> _onFilterTaskByDateEvent(
    FilterTaskByDateEvent event,
    Emitter<TaskPlannerState> emit,
  ) async {
    emit(
      state.copyWith(
        viewState: ViewState.processing,
      ),
    );
    final taskResult = await getTasksUseCase(event.date);
    taskResult.fold(
      (error) => emit(
        state.copyWith(
          viewState: ViewState.error,
          errorMessage: error.message,
        ),
      ),
      (tasks) => emit(
        state.copyWith(
          tasks: tasks,
          viewState: ViewState.success,
        ),
      ),
    );
    emit(state.copyWith(viewState: ViewState.idle));
  }
}
