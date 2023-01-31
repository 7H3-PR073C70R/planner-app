import 'package:flutter_test/flutter_test.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';

void main() {
  group('category entity ...', () {
    test(
      'verify that two [CategoryEntity] objects are equal when their data '
      'is equal',
      () {
        expect(
          const CategoryEntity(
            color: '#color',
            name: 'name',
          ),
          const CategoryEntity(
            color: '#color',
            name: 'name',
          ),
        );
      },
    );

    test(
      'verify that [copyWith] change the right data while '
      'keeping the rest of the data',
      () {
        const category = CategoryEntity(
          color: '#color',
          name: 'name',
        );

        //! Act
        final secondCategory = category.copyWith(
          name: 'Second name',
        );

        //! Assert
        expect(
          secondCategory,
          const CategoryEntity(
            color: '#color',
            name: 'Second name',
          ),
        );
      },
    );
  });
}
