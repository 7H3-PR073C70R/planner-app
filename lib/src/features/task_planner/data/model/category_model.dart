import 'package:planner_app/src/core/utils/helper.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    required super.color,
    required super.name,
  });

  factory CategoryModel.fromEntity(CategoryEntity entity) => CategoryModel(
        color: entity.color,
        name: entity.name,
        id: entity.id,
      );

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final field = json['fields'] as Map<String, dynamic>;
    return CategoryModel(
      id: (json['name'] as String).split('/').last,
      color: getFieldData(json: field, key: 'color')['stringValue'] as String,
      name: getFieldData(json: field, key: 'name')['stringValue'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'fields': {
          'name': {
            'stringValue': name,
          },
          'color': {
            'stringValue': color,
          }
        }
      };
}
