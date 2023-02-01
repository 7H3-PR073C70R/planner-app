import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/core/enums/enums.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';

void main() {
  group('task planner state ...', () {
    test(
      'verify that two instances of [TaskPlannerState] are equal when '
      'they have the same properties',
      () {
        expect(
          const TaskPlannerState(
            categories: [],
            tasks: [],
            errorMessage: null,
            viewState: ViewState.idle,
          ),
          const TaskPlannerState(
            categories: [],
            tasks: [],
            errorMessage: null,
            viewState: ViewState.idle,
          ),
        );
      },
    );
    test(
      'verify that two instances of [TaskPlannerState.initial] have the'
      ' default properties',
      () {
        expect(
          const TaskPlannerState(
            categories: [],
            tasks: [],
            errorMessage: null,
            viewState: ViewState.idle,
          ),
          TaskPlannerState.initial(),
        );
      },
    );
    test(
      'verify that two instances of [copyWith] change the specify property'
      ' while leaving the rest',
      () {
        expect(
          TaskPlannerState.initial().copyWith(
            viewState: ViewState.processing,
          ),
          const TaskPlannerState(
            categories: [],
            tasks: [],
            errorMessage: null,
            viewState: ViewState.processing,
          ),
        );
      },
    );
  });
}
