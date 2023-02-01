import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';

void main() {
  group('task planner event ...', () {
    test('verify that two instances of [InitEvent] are equal', () {
      expect(const InitEvent(), const InitEvent());
    });

    test(
      'verify that two instances of [SaveCategoryEvent] when the '
      'properties are equal',
      () {
        expect(
          const SaveCategoryEvent(
            CategoryEntity(color: 'color', name: 'name'),
          ),
          const SaveCategoryEvent(
            CategoryEntity(color: 'color', name: 'name'),
          ),
        );
      },
    );
    test(
      'verify that two instances of [SaveTaskEvent] when the '
      'properties are equal',
      () {
        expect(
          const SaveTaskEvent(
            TaskEntity(name: 'name', categoryId: 'id', date: 'date'),
          ),
          const SaveTaskEvent(
            TaskEntity(name: 'name', categoryId: 'id', date: 'date'),
          ),
        );
      },
    );
    test(
      'verify that two instances of [UpdateTaskEvent] when the '
      'properties are equal',
      () {
        expect(
          const UpdateTaskEvent(
            TaskEntity(name: 'name', categoryId: 'id', date: 'date'),
          ),
          const UpdateTaskEvent(
            TaskEntity(name: 'name', categoryId: 'id', date: 'date'),
          ),
        );
      },
    );
    test(
      'verify that two instances of [FilterTaskByDateEvent] when the '
      'properties are equal',
      () {
        expect(
          const FilterTaskByDateEvent(
            'date',
          ),
          const FilterTaskByDateEvent(
            'date',
          ),
        );
      },
    );
  });
}
