import 'package:flutter/material.dart';

class CardImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final BorderRadius borderRadius;

  const CardImage({
    required this.imageUrl,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
