import 'package:flutter/material.dart';

class AppSpacing {
  const AppSpacing._();

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Vertical Spacing
  static const SizedBox verticalSpaceTiny = SizedBox(height: 4);
  static const SizedBox verticalSpaceSmall = SizedBox(height: 8);
  static const SizedBox verticalSpaceMedium = SizedBox(height: 16);
  static const SizedBox verticalSpaceLarge = SizedBox(height: 24);
  static const SizedBox verticalSpaceHuge = SizedBox(height: 32);
  static const SizedBox verticalSpaceMassive = SizedBox(height: 40);
  static SizedBox setVerticalSpace(double h) => SizedBox(height: h);

  // Vertical Heights.
  static double verticalValueTiny = 4;
  static double verticalValueSmall = 8;

  // Horizontal Spacing.
  static const SizedBox horizontalSpaceTiny = SizedBox(width: 4);
  static const SizedBox horizontalSpaceSmall = SizedBox(width: 8);
  static const SizedBox horizontalSpaceMedium = SizedBox(width: 16);
  static const SizedBox horizontalSpaceLarge = SizedBox(width: 24);
  static const SizedBox horizontalSpaceHuge = SizedBox(width: 32);
  static const SizedBox horizontalSpaceMassive = SizedBox(width: 40);
  static SizedBox setHorizontalSpace(double w) => SizedBox(width: w);

  static double horizontalSpacing = 25;
}
