import 'package:flutter/material.dart';

class CardText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CardText({
    required this.text,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
