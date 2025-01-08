import 'package:flutter/material.dart';
import 'package:seektest/shared/widgets/atoms/card_image.dart';
import 'package:seektest/shared/widgets/atoms/card_text.dart';
import 'package:seektest/shared/widgets/atoms/card_overlay.dart';

class ImageInfoCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final String? description;
  final VoidCallback? onTap;

  const ImageInfoCard({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    this.description,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Stack(
          children: [
            CardImage(
              imageUrl: imageUrl,
              height: size.height * 0.3,
            ),
            CardOverlay(
              height: size.height * 0.3,
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardText(
                    text: title,
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  CardText(
                    text: subtitle,
                    style: textTheme.bodyMedium?.copyWith(
                      color: Colors.white70,
                    ),
                  ),
                  if (description != null) ...[
                    const SizedBox(height: 4),
                    CardText(
                      text: description!,
                      style: textTheme.bodySmall?.copyWith(
                        color: description == 'Alive' ? Colors.greenAccent : Colors.redAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
