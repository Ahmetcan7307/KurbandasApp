import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const ActionButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: color ?? Theme.of(context).primaryColor,
              size: 20,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style:
                  TextStyle(fontSize: 12, color: color ?? Colors.grey.shade700),
            )
          ],
        ),
      ),
    );
  }
}
