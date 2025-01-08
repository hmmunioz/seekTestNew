import 'package:flutter/material.dart';
import 'package:seektest/shared/utils/screen_utils.dart';
import 'app_colors.dart';

class AppStyles {
  static TextTheme generateTextTheme(BuildContext context) {
    return TextTheme(
      titleLarge: TextStyle(
        fontSize: ScreenUtils.scaleFont(context, 20),
        fontWeight: FontWeight.bold,
        color: AppColors.lightText,
        fontFamily: 'Stone Serif Semibold',
      ),
      bodyMedium: TextStyle(
        fontSize: ScreenUtils.scaleFont(context, 16),
        color: AppColors.lightText,
        fontFamily: 'Stone Serif Regular',
      ),
      bodySmall: TextStyle(
        fontSize: ScreenUtils.scaleFont(context, 14),
        color: AppColors.lightText,
        fontFamily: 'Stone Serif Regular',
      ),
    );
  }

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.purpleLight,
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: generateTextTheme(context),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: AppColors.portalGreen,
        onPrimary: AppColors.lightText,
        secondary: AppColors.mortyYellow,
        onSecondary: AppColors.lightText,
        error: AppColors.errorRed,
        onError: AppColors.lightBackground,
        surface: AppColors.lightBackground,
        onSurface: AppColors.lightText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.portalGreen,
        foregroundColor: AppColors.lightText,
        elevation: 2,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.rickGreen,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: generateTextTheme(context),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.rickGreen,
        onPrimary: AppColors.darkText,
        secondary: AppColors.mortyYellow,
        onSecondary: AppColors.darkText,
        error: AppColors.errorRed,
        onError: AppColors.darkBackground,
        surface: AppColors.darkBackground,
        onSurface: AppColors.darkText,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.rickGreen,
        foregroundColor: AppColors.darkText,
        elevation: 2,
      ),
    );
  }
}
