import 'package:flutter/material.dart';

class Logger {
  static void logError(String message, {StackTrace? stackTrace}) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] Error: $message');
    if (stackTrace != null) {
      debugPrint('[$timestamp] StackTrace: $stackTrace');
    }
  }
}
