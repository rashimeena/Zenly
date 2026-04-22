import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class JournalPageHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final double titleSize;
  final FontWeight titleWeight;
  final double spacing;

  const JournalPageHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleSize = 28,
    this.titleWeight = FontWeight.w300,
    this.spacing = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: titleSize,
            fontWeight: titleWeight,
            color: AppColors.onSurface,
          ),
        ),
        SizedBox(height: spacing),
        Text(
          subtitle,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
