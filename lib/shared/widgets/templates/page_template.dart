import 'package:flutter/material.dart';

class PageTemplate extends StatelessWidget {
  final String? title;
  final Widget body;

  const PageTemplate({this.title, required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              title!,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
            ),
          ),
        Expanded(child: body),
      ],
    );
  }
}
