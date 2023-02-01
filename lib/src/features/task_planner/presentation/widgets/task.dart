import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/src/core/constants/app_spacing.dart';
import 'package:planner_app/src/core/extensions/extensions.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/category_entity.dart';
import 'package:planner_app/src/features/task_planner/domain/entities/task_entity.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';
import 'package:planner_app/src/shared/custom_check_box.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.taskEntity,
  });

  final TaskEntity taskEntity;

  @override
  Widget build(BuildContext context) {
    final completed = taskEntity.isCompleted;

    return BlocBuilder<TaskPlannerBloc, TaskPlannerState>(
      builder: (context, state) {
        final category = state.categories.firstWhere(
          (element) => element.id == taskEntity.categoryId,
          orElse: () => const CategoryEntity(
            color: '',
            name: 'category',
          ),
        );
        return Row(
          children: [
            CustomCheckBox(
              value: taskEntity.isCompleted,
              onChanged: (_) => context.read<TaskPlannerBloc>().add(
                    UpdateTaskEvent(
                      taskEntity.copyWith(
                        isCompleted: !taskEntity.isCompleted,
                      ),
                    ),
                  ),
            ),
            AppSpacing.horizontalSpaceMedium,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskEntity.name,
                    style: context.textTheme.displayLarge?.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: completed ? const Color(0xFFB9B9BE) : null,
                    ),
                  ),
                  Visibility(
                    visible: !completed,
                    child: Column(
                      children: [
                        AppSpacing.verticalSpaceSmall,
                        Text(
                          category.name,
                          style: context.textTheme.displayLarge?.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFFB9B9BE),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
