import 'package:flutter/material.dart';

class SearchBarCustom extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onSearchChanged;

  const SearchBarCustom({
    super.key,
    required this.hintText,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[800] : Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        onChanged: onSearchChanged,
        style: theme.textTheme.bodyMedium?.copyWith(
          color: theme.textTheme.bodyMedium?.color,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: isDarkMode ? Colors.grey[400] : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
