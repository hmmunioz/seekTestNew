import 'package:flutter/material.dart';

class SmallTitle extends StatelessWidget {
  final String text;

  const SmallTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),
    );
  }
}
