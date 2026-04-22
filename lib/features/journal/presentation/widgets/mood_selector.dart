import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class MoodSelector extends StatefulWidget {
  final String initialMood;
  final ValueChanged<String> onMoodChanged;

  const MoodSelector({
    super.key,
    required this.initialMood,
    required this.onMoodChanged,
  });

  @override
  State<MoodSelector> createState() => _MoodSelectorState();
}

class _MoodSelectorState extends State<MoodSelector> {
  late String selected;

  final moods = ["Calm", "Grounded", "Energized", "Sleepy"];

  @override
  void initState() {
    super.initState();
    selected = widget.initialMood;
  }

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
                widget.onMoodChanged(mood);
              },
              selectedColor: AppColors.primaryContainer,
            );
          }).toList(),
        ),
      ],
    );
  }
}