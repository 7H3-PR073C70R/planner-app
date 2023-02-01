import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:planner_app/bootstrap.dart';
import 'package:planner_app/src/core/themes/app_theme.dart';
import 'package:planner_app/src/features/task_planner/presentation/bloc/task_planner_bloc.dart';
import 'package:planner_app/src/features/task_planner/presentation/pages/task_page.dart';
import 'package:planner_app/src/locator.dart';

void main() async {
  await init();
  await bootstrap(MyApp.new);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskPlannerBloc(
        getCategoriesUseCase: locator(),
        getTasksUseCase: locator(),
        saveCategoryUseCase: locator(),
        saveTaskUseCase: locator(),
        updateTaskUseCase: locator(),
      )..add(const InitEvent()),
      child: MaterialApp(
        title: 'App Name',
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const TaskPage(),
      ),
    );
  }
}
