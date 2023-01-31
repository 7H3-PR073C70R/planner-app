import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/features/task_planner/data/model/task_model.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';

import '../../../../../utils/data.dart';

void main() {
  group('task model ...', () {
    test(
      'verify that [fromJson] return the right data',
      () {
        expect(TaskModel.fromJson(taskJson), task);
      },
    );
    test(
      'verify that [toJson] return the right data',
      () {
        expect(
            const TaskModel(
              name: 'testing',
              categoryId: 'DDQeCPpZATcLfV9U3I0v',
              date: '1664072803',
            ).toJson(),
            {
              'fields': {
                'date': {'integerValue': '1664072803'},
                'categoryId': {'stringValue': 'DDQeCPpZATcLfV9U3I0v'},
                'name': {'stringValue': 'testing'},
                'isCompleted': {'booleanValue': false}
              }
            });
      },
    );

    test('verify that [fromEntity] return the right data', () {
      expect(
        const TaskModel(
          name: 'name',
          categoryId: 'id',
          date: 'date',
          id: 'id',
          isCompleted: true,
        ),
        TaskModel.fromEntity(
          const TaskEntity(
            name: 'name',
            categoryId: 'id',
            date: 'date',
            id: 'id',
            isCompleted: true,
          ),
        ),
      );
    });
  });
}
