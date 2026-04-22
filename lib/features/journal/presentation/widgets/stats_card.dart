import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StatsCards extends StatelessWidget {
  const StatsCards({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 400;

        return Row(
          children: [
            Expanded(
              child: _card(
                icon: Icons.timer_outlined,
                title: "Session Time",
                value: "45 min",
              ),
            ),
            SizedBox(width: isWide ? 16 : 10),
            Expanded(
              child: _card(
                icon: Icons.favorite_border_rounded,
                title: "Avg Heart Rate",
                value: "62 BPM",
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _card({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.primary),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(fontSize: 12)),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}