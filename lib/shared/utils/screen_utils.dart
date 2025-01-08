import 'package:flutter/material.dart';

class ScreenUtils {
  static double scaleFont(BuildContext context, double fontSize) {
    final mediaQuery = MediaQuery.of(context);
    final scaleFactor = mediaQuery.size.width / 375.0;
    return fontSize * scaleFactor;
  }
}
