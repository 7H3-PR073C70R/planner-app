import 'package:flutter/material.dart';
import 'package:wimueve_mobile/src/core/extensions/extensions.dart';

class AppSpacing {
  const AppSpacing._();

  static double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size;

  static double screenWidth(BuildContext context) =>
      MediaQuery.of(context).size;

  // Vertical Spacing
  static const verticalSpaceTiny = SizedBox(height: 4);
  static const verticalSpaceSmall = SizedBox(height: 8);
  static const verticalSpaceMedium = SizedBox(height: 16);
  static const verticalSpaceLarge = SizedBox(height: 24);
  static const verticalSpaceHuge = SizedBox(height: 32);
  static const verticalSpaceMassive = SizedBox(height: 40);
  static const setVerticalSpace(num h) => SizedBox(height: h);

  // Vertical Heights.
  static double verticalValueTiny = 4;
  static double verticalValueSmall = 8;

  // Horizontal Spacing.
  static const horizontalSpaceTiny = SizedBox(width: 4);
  static const horizontalSpaceSmall = SizedBox(width: 8);
  static const horizontalSpaceMedium = SizedBox(width: 16);
  static const horizontalSpaceLarge = SizedBox(width: 24);
  static const horizontalSpaceHuge = SizedBox(width: 32);
  static const horizontalSpaceMassive = SizedBox(width: 40);
  static const setHorizontalSpace(num w) => SizedBox(width: w);

  static double horizontalSpacing = 25;
}
