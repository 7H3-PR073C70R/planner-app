import 'package:flutter/material.dart';
import 'package:planner_app/src/core/enums/enums.dart';

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
}

extension ViewStateExtension on ViewState {
  bool get isIdle => this == ViewState.idle;
  bool get isProcessing => this == ViewState.processing;
  bool get isSuccess => this == ViewState.success;
  bool get isError => this == ViewState.error;
}
