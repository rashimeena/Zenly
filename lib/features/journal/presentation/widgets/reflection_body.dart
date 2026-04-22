import 'package:flutter/material.dart';

class ReflectionBody extends StatelessWidget {
  const ReflectionBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            "https://picsum.photos/500",
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 20),

        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F6D1),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Text(
            "The silence of the early morning forest was exactly what my mind needed. "
            "Today, the world felt like it was exhaling, and I found myself breathing in sync...",
            style: TextStyle(height: 1.6),
          ),
        ),
      ],
    );
  }
}