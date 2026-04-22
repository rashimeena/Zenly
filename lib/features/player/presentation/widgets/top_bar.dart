import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String title;

  const TopBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            color: AppColors.primary,
            onPressed: () => Navigator.pop(context),
          ),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: AppColors.onSurface,
            ),
          ),

          IconButton(
            icon: const Icon(Icons.more_horiz),
            color: AppColors.primary,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}