import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SaveSection extends StatelessWidget {
  const SaveSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context); // later → save + go history
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryContainer,
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: const Text(
            "Save Reflection",
            style: TextStyle(color: AppColors.onSurface),
          ),
        ),

        const SizedBox(height: 10),

        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text("Dismiss for now"),
        ),
      ],
    );
  }
}