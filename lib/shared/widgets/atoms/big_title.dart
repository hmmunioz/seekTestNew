import 'package:flutter/material.dart';

class BigTitle extends StatelessWidget {
  final String text;

  const BigTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Colors.white,
          ),
    );
  }
}
