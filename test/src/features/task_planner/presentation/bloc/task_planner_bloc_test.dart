import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:planner_app/src/core/enums/enums.dart';
import 'package:planner_app/src/core/error/failure.dart';
import 'package:planner_app/src/core/utils/use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_categories_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/get_tasks_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_category_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/save_task_use_case.dart';
import 'package:planner_app/src/features/task_planner/domain/use_cases/update_task_use_case.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';

import '../../../../../utils/data.dart';

class GetCategoriesUseCaseMock extends Mock implements GetCategoriesUseCase {}

class GetTasksUseCaseMock extends Mock implements GetTasksUseCase {}

class UpdateTaskUseCaseMock extends Mock implements UpdateTaskUseCase {}

class SaveTaskUseCaseMock extends Mock implements SaveTaskUseCase {}

class SaveCategoryUseCaseMock extends Mock implements SaveCategoryUseCase {}

void main() {
  late final GetCategoriesUseCase getCategoriesUseCase;
  late final GetTasksUseCase getTasksUseCase;
  late final UpdateTaskUseCase updateTaskUseCase;
  late final SaveTaskUseCase saveTaskUseCase;
  late final SaveCategoryUseCase saveCategoryUseCase;

  setUpAll(() {
    getTasksUseCase = GetTasksUseCaseMock();
    getCategoriesUseCase = GetCategoriesUseCaseMock();
    updateTaskUseCase = UpdateTaskUseCaseMock();
    saveCategoryUseCase = SaveCategoryUseCaseMock();
    saveTaskUseCase = SaveTaskUseCaseMock();
  });
  group('task planner bloc ...', () {
    test('verify that [TaskPlannerBloc] have the initial state', () {
      final bloc = TaskPlannerBloc(
        getCategoriesUseCase: getCategoriesUseCase,
        getTasksUseCase: getTasksUseCase,
        updateTaskUseCase: updateTaskUseCase,
        saveTaskUseCase: saveTaskUseCase,
        saveCategoryUseCase: saveCategoryUseCase,
      );

      expect(bloc.state, TaskPlannerState.initial());
      bloc.close();
    });

    group(
      'initial event...',
      () {
        //! Success State
        blocTest<TaskPlannerBloc, TaskPlannerState>(
          'verify that when [InitEvent] event is added to the bloc the '
          'right states are been emitted in terms of success',
          build: () => TaskPlannerBloc(
            getCategoriesUseCase: getCategoriesUseCase,
            getTasksUseCase: getTasksUseCase,
            updateTaskUseCase: updateTaskUseCase,
            saveTaskUseCase: saveTaskUseCase,
            saveCategoryUseCase: saveCategoryUseCase,
          ),
          setUp: () {
            when(() => getCategoriesUseCase(NoParam())).thenAnswer(
              (invocation) async => const Right(
                [category],
              ),
            );
            when(() => getTasksUseCase(null)).thenAnswer(
              (invocation) async => const Right(
                [task],
              ),
            );
          },
          act: (bloc) => bloc.add(const InitEvent()),
          expect: () => [
            TaskPlannerState.initial()
                .copyWith(viewState: ViewState.processing),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.processing,
              categories: [category],
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.success,
              categories: [category],
              tasks: [task],
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.idle,
              categories: [category],
              tasks: [task],
            ),
          ],
        );

        //! Failure State
        blocTest<TaskPlannerBloc, TaskPlannerState>(
          'verify that when [InitEvent] event is added to the bloc the '
          'right states are been emitted in terms of failure',
          build: () => TaskPlannerBloc(
            getCategoriesUseCase: getCategoriesUseCase,
            getTasksUseCase: getTasksUseCase,
            updateTaskUseCase: updateTaskUseCase,
            saveTaskUseCase: saveTaskUseCase,
            saveCategoryUseCase: saveCategoryUseCase,
          ),
          setUp: () {
            when(() => getCategoriesUseCase(NoParam())).thenAnswer(
              (invocation) async => const Right(
                [category],
              ),
            );
            when(() => getTasksUseCase(null)).thenAnswer(
              (invocation) async => const Left(
                ServerFailure(message: 'Something went wrong'),
              ),
            );
          },
          act: (bloc) => bloc.add(const InitEvent()),
          expect: () => [
            TaskPlannerState.initial()
                .copyWith(viewState: ViewState.processing),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.processing,
              categories: [category],
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.error,
              categories: [category],
              tasks: [],
              errorMessage: 'Something went wrong',
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.idle,
              categories: [category],
              tasks: [],
              errorMessage: 'Something went wrong',
            ),
          ],
        );
      },
    );

    group(
      'save category event...',
      () {
        //! Success State
        blocTest<TaskPlannerBloc, TaskPlannerState>(
          'verify that when [InitEvent] event is added to the bloc the '
          'right states are been emitted in terms of success',
          build: () => TaskPlannerBloc(
            getCategoriesUseCase: getCategoriesUseCase,
            getTasksUseCase: getTasksUseCase,
            updateTaskUseCase: updateTaskUseCase,
            saveTaskUseCase: saveTaskUseCase,
            saveCategoryUseCase: saveCategoryUseCase,
          ),
          setUp: () {
            when(() => saveCategoryUseCase(category)).thenAnswer(
              (invocation) async => const Right(
                category,
              ),
            );
          },
          act: (bloc) => bloc.add(const SaveCategoryEvent(category)),
          expect: () => [
            TaskPlannerState.initial()
                .copyWith(viewState: ViewState.processing),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.success,
              categories: [category],
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.idle,
              categories: [category],
            ),
          ],
        );

        //! Failure State
        blocTest<TaskPlannerBloc, TaskPlannerState>(
          'verify that when [InitEvent] event is added to the bloc the '
          'right states are been emitted in terms of failure',
          build: () => TaskPlannerBloc(
            getCategoriesUseCase: getCategoriesUseCase,
            getTasksUseCase: getTasksUseCase,
            updateTaskUseCase: updateTaskUseCase,
            saveTaskUseCase: saveTaskUseCase,
            saveCategoryUseCase: saveCategoryUseCase,
          ),
          setUp: () {
             when(() => saveCategoryUseCase(category)).thenAnswer(
              (invocation) async => const Left(
                ServerFailure(message: 'Something Went wrong'),
              ),
            );
          },
          act: (bloc) => bloc.add(const SaveCategoryEvent(category)),
          expect: () => [
            TaskPlannerState.initial()
                .copyWith(viewState: ViewState.processing),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.error,
              categories: [],
              tasks: [],
              errorMessage: 'Something went wrong',
            ),
            TaskPlannerState.initial().copyWith(
              viewState: ViewState.idle,
              categories: [],
              tasks: [],
              errorMessage: 'Something went wrong',
            ),
          ],
        );
      },
    );
  });
}
