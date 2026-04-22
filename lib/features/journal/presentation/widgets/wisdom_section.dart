import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class WisdomSection extends StatelessWidget {
  const WisdomSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.auto_awesome, color: AppColors.primary),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            '"Nature does not hurry, yet everything is accomplished."',
          ),
        ),
      ],
    );
  }
}