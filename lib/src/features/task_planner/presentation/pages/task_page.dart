import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:planner_app/src/core/constants/app_spacing.dart';
import 'package:planner_app/src/core/extensions/extensions.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';
import 'package:planner_app/src/features/task_planner/presentation/pages/add_task_page.dart';
import 'package:planner_app/src/features/task_planner/presentation/widgets/header.dart';
import 'package:planner_app/src/features/task_planner/presentation/widgets/task.dart';

class TaskPage extends HookWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final date = useState(DateTime.now());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            CupertinoPageRoute<Widget>(
              builder: (_) => AddTaskPage(),
            ),
          );
        },
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<TaskPlannerBloc, TaskPlannerState>(
            listener: (context, state) {
              if (state.viewState.isError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(
                      state.errorMessage ?? '',
                      style: context.textTheme.displayLarge?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              }
            },
            bloc: context.read<TaskPlannerBloc>(),
            builder: (context, state) {
              if (state.viewState.isProcessing) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final tasks = state.tasks.where(
                (element) =>
                    DateFormat('MMMM dd, yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(
                        int.parse(
                          element.date,
                        ),
                      ),
                    ) ==
                    DateFormat('MMMM dd, yyyy').format(date.value),
              );
              final completeTask =
                  tasks.where((task) => task.isCompleted).toList();
              final inCompleteTask = tasks
                  .where(
                    (task) => !task.isCompleted,
                  )
                  .toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSpacing.setVerticalSpace(10),
                  Header(
                    date: date,
                    incompleteTask: inCompleteTask.length,
                    completeTask: completeTask.length,
                  ),
                  AppSpacing.verticalSpaceMedium,
                  const Divider(
                    thickness: 2,
                    height: 1,
                  ),
                  Expanded(
                    child: AnimatedCrossFade(
                      firstChild: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Tasks Found',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            AppSpacing.setVerticalSpace(4),
                            Text(
                              'Click the plus button to add new task',
                              style: context.textTheme.displayLarge?.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFB9B9BE),
                              ),
                            ),
                          ],
                        ),
                      ),
                      secondChild: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppSpacing.verticalSpaceMedium,
                          Text(
                            'Incomplete',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppSpacing.verticalSpaceMedium,
                          Expanded(
                            child: ListView.separated(
                              itemCount: inCompleteTask.length,
                              itemBuilder: (_, index) => Task(
                                taskEntity: inCompleteTask[index],
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      AppSpacing.verticalSpaceMedium,
                            ),
                          ),
                          AppSpacing.setVerticalSpace(32),
                          Text(
                            'Completed',
                            style: context.textTheme.displayLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          AppSpacing.verticalSpaceMedium,
                          Expanded(
                            child: ListView.separated(
                              itemCount: completeTask.length,
                              itemBuilder: (_, index) => Task(
                                taskEntity: completeTask[index],
                              ),
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      AppSpacing.verticalSpaceMedium,
                            ),
                          ),
                        ],
                      ),
                      crossFadeState: tasks.isEmpty
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
