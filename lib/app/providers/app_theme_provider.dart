import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = StateNotifierProvider<AppThemeNotifier, ThemeMode>((ref) {
  return AppThemeNotifier();
});

class AppThemeNotifier extends StateNotifier<ThemeMode> {
  AppThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
