import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/features/task_planner/data/model/category_model.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';

import '../../../../../utils/data.dart';

void main() {
  group('category model ...', () {
    test(
      'verify that [fromJson] return the right data',
      () {
        expect(CategoryModel.fromJson(categoryJson), category);
      },
    );
    test(
      'verify that [toJson] return the right data',
      () {
        expect(
          const CategoryModel(color: '#simple', name: 'test').toJson(),
          {
            'fields': {
              'name': {'stringValue': 'test'},
              'color': {'stringValue': '#simple'}
            }
          },
        );
      },
    );

    test('verify that [fromEntity] return the right data', () {
      expect(
        const CategoryModel(color: 'color', name: 'name'),
        CategoryModel.fromEntity(
          const CategoryEntity(
            color: 'color',
            name: 'name',
          ),
        ),
      );
    });
  });
}
