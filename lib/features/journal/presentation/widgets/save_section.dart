
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SaveSection extends StatelessWidget {
  final VoidCallback onSave;

  const SaveSection({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: onSave,
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