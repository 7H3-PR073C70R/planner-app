import 'package:flutter/material.dart';
import 'package:planner_app/bootstrap.dart';
import 'package:planner_app/src/core/themes/app_theme.dart';

void main() async {
  await bootstrap(MyApp.new);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Name',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const Scaffold(),
    );
  }
}
