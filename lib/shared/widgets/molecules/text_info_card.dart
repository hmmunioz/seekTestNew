import 'package:flutter/material.dart';

class TextInfoCard extends StatelessWidget {
  final String title;
  final String subtitleLeft;
  final String subtitleRight;
  final String additionalInfo;
  final IconData icon;

  const TextInfoCard({
    super.key,
    required this.title,
    required this.subtitleLeft,
    required this.subtitleRight,
    required this.additionalInfo,
    this.icon = Icons.info,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subtitleLeft,
                  style: textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
                Text(
                  subtitleRight,
                  style: textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(
                  icon,
                  color: Theme.of(context).colorScheme.primary,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  additionalInfo,
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
