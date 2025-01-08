import 'package:flutter/material.dart';

class CardOverlay extends StatelessWidget {
  final double height;
  final BorderRadius borderRadius;

  const CardOverlay({
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
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.7),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}
