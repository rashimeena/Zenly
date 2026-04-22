import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class HistoryTopBar extends StatelessWidget {
  const HistoryTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.menu),
            color: AppColors.primary,
            onPressed: () {},
          ),

          const Text(
            "Reflections",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),

          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/150",
            ),
          ),
        ],
      ),
    );
  }
}