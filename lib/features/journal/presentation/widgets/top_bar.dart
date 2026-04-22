import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ReflectionTopBar extends StatelessWidget {
  const ReflectionTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.primary,
            onPressed: () => Navigator.pop(context),
          ),

          const Text(
            "Reflect",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),

          IconButton(
            icon: const Icon(Icons.more_vert),
            color: AppColors.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}