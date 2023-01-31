import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planner_app/src/core/constants/app_colors.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF5F5F5).withAlpha(253),
        textTheme: const TextTheme(
          bodySmall:  TextStyle(color: Colors.white),
          bodyLarge:  TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
          bodyMedium:  TextStyle(
            color: AppColors.black,
            fontSize: 14,
          ),
          displayLarge:  TextStyle(
            color: AppColors.black,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            color: AppColors.black,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
          titleLarge:  TextStyle(
            color: AppColors.black,
          ),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light.copyWith(
            statusBarBrightness: Brightness.light,
            statusBarColor: AppColors.black,
            systemNavigationBarColor: AppColors.black,
            systemNavigationBarContrastEnforced: true,
            systemStatusBarContrastEnforced: true,
            statusBarIconBrightness: Brightness.light,
          ),
          titleTextStyle: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Mont',
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: const MaterialColor(
          0xFFFFFFFF,
          {
            50: Color(0xFFFFFFFF),
            100: Color(0xFFFFFFFF),
            200: Color(0xFFFFFFFF),
            300: Color(0xFFFFFFFF),
            400: Color(0xFFFFFFFF),
            500: Color(0xFFFFFFFF),
            600: Color(0xFFFFFFFF),
            700: Color(0xFFFFFFFF),
            800: Color(0xFFFFFFFF),
            900: Color(0xFFFFFFFF),
          },
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          color: Color(0xFFFFFFFF),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0xFF000000),
          ),
        ),
      );
}
