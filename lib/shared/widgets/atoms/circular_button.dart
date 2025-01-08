import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color? color;

  const CircularButton({
    required this.onPressed,
    required this.icon,
    required this.label,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color ?? Theme.of(context).primaryColor),
      label: Text(
        label,
        style: TextStyle(
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
    );
  }
}
