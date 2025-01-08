import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_styles.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColors.portalGreen,
      scaffoldBackgroundColor: AppColors.lightBackground,
      textTheme: AppStyles.generateTextTheme(context),
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
      textTheme: AppStyles.generateTextTheme(context),
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
