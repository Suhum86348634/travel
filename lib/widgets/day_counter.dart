import 'package:flutter/material.dart';


class DayCounter extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const DayCounter({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 16, color: cs.onPrimaryContainer),
        onPressed: onPressed,
      ),
    );
  }
}