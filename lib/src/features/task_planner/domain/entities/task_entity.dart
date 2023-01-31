import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  const TaskEntity({
    this.id,
    required this.categoryId,
    required this.date,
    this.isCompleted = false,
    required this.name,
  });

  final String? id;
  final String? categoryId;
  final String name;
  final bool isCompleted;
  final String date;

  TaskEntity copyWith({
    String? categoryId,
    String? name,
    bool? isCompleted,
    String? date,
  }) =>
      TaskEntity(
        categoryId: categoryId ?? this.categoryId,
        date: date ?? this.date,
        name: name ?? this.name,
      );

  @override
  List<Object?> get props => [
        categoryId,
        date,
        isCompleted,
        name,
      ];
}
