import 'package:planner_app/src/core/utils/helper.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  const TaskModel({
    super.id,
    super.isCompleted,
    required super.categoryId,
    required super.date,
    required super.name,
  });

  factory TaskModel.fromEntity(TaskEntity entity) => TaskModel(
        categoryId: entity.categoryId,
        date: entity.date,
        name: entity.name,
        id: entity.id,
        isCompleted: entity.isCompleted,
      );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    final fields = json['fields'] as Map<String, dynamic>;
    return TaskModel(
      id: (json['name'] as String).split('/').last,
      categoryId: getFieldData(json: fields, key: 'categoryId')['stringValue']
          as String,
      date: getFieldData(json: fields, key: 'date')['integerValue'] as String,
      name: getFieldData(json: fields, key: 'name')['stringValue'] as String,
      isCompleted:
          getFieldData(json: fields, key: 'isCompleted')['booleanValue']
              as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'fields': {
          'date': {'integerValue': date},
          'categoryId': {'stringValue': categoryId},
          'name': {'stringValue': name},
          'isCompleted': {'booleanValue': isCompleted}
        }
      };
}
