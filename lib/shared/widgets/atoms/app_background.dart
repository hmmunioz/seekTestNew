import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final Gradient? overlayGradient;

  const AppBackground({
    super.key,
    required this.imagePath,
    this.fit = BoxFit.cover,
    this.overlayGradient,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            fit: fit,
            width: double.infinity,
            height: double.infinity,
          ),
          if (overlayGradient != null)
            Container(
              decoration: BoxDecoration(
                gradient: overlayGradient,
              ),
            ),
        ],
      ),
    );
  }
}
