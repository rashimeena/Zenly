import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoodSelector extends StatefulWidget {
  const MoodSelector({super.key});

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  String selected = "Grounded";

  final moods = ["Calm", "Grounded", "Energized", "Sleepy"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "CURRENT RESONANCE",
          style: TextStyle(fontSize: 12, color: Colors.black54),
        ),

        const SizedBox(height: 10),

        Wrap(
          spacing: 10,
          children: moods.map((mood) {
            final isSelected = mood == selected;

            return ChoiceChip(
              label: Text(mood),
              selected: isSelected,
              onSelected: (_) {
                setState(() => selected = mood);
              },
              selectedColor: AppColors.primaryContainer,
            );
          }).toList(),
        ),
      ],
    );
  }
}