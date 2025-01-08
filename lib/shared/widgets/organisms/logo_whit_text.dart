import 'package:flutter/material.dart';

class LogoWithText extends StatelessWidget {
  final String imagePath;
  final String text;

  const LogoWithText({required this.imagePath, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          height: 100,
        ),
        const SizedBox(height: 16),
        Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
