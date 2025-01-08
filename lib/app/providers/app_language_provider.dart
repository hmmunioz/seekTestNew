import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appLanguageProvider = StateNotifierProvider<AppLanguageNotifier, Locale>((ref) {
  return AppLanguageNotifier();
});

class AppLanguageNotifier extends StateNotifier<Locale> {
  AppLanguageNotifier() : super(const Locale('es', 'ES'));

  void toggleLanguage() {
    state = state.languageCode == 'es' ? const Locale('en', 'US') : const Locale('es', 'ES');
  }
}
