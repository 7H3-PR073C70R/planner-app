import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.color,
    required this.name,
    this.id,
  });

  final String? id;
  final String name;
  final String color;

  CategoryEntity copyWith({
    String? color,
    String? name,
  }) =>
      CategoryEntity(
        color: color ?? this.color,
        name: name ?? this.name,
        id: id,
      );
  @override
  List<Object?> get props => [
        name,
        color,
      ];
}
