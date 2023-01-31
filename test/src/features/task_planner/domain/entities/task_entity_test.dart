import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';

void main() {
  group('task entity ...', () {
    test(
      'verify that two [TaskEntity] objects are equal when their data '
      'is equal',
      () {
        expect(
          const TaskEntity(
            categoryId: 'categoryId',
            date: 'date',
            name: 'name',
          ),
          const TaskEntity(
            categoryId: 'categoryId',
            date: 'date',
            name: 'name',
          ),
        );
      },
    );

    test(
      'verify that [copyWith] change the right data while '
      'keeping the rest of the data',
      () {
        const task = TaskEntity(
          categoryId: 'categoryId',
          date: 'date',
          name: 'name',
        );

        //! Act
       final secondTask =  task.copyWith(
          name: 'Second name',
        );

        //! Assert
        expect(
          secondTask,
          const TaskEntity(
            categoryId: 'categoryId',
            date: 'date',
            name: 'Second name',
          ),
        );
      },
    );
  });
}
