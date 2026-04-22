import 'package:flutter/material.dart';

class ReflectionHeader extends StatelessWidget {
  const ReflectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "AMBIENCE",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),

        const SizedBox(height: 6),

        const Text(
          "Forest Focus",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 6),

        const Text("October 24, 8:30 AM"),

        const SizedBox(height: 12),

        Wrap(
          spacing: 10,
          children: const [
            Chip(label: Text("Grounded")),
            Chip(label: Text("Morning Calm")),
          ],
        ),
      ],
    );
  }
}