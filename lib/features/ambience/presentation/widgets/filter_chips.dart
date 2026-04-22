import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AmbienceFilterChips extends StatelessWidget {
  const AmbienceFilterChips({
    super.key,
    required this.tags,
    required this.selectedTag,
    required this.onSelected,
  });

  final List<String> tags;
  final String selectedTag;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final tag = tags[index];
          final selected = tag == selectedTag;

          return ChoiceChip(
            label: Text(tag),
            selected: selected,
            onSelected: (_) => onSelected(tag),
            labelStyle: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
                  color: selected ? Colors.white : AppColors.onSurface,
                ),
            selectedColor: AppColors.primary,
            backgroundColor: AppColors.surfaceContainerHigh,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(99)),
            side: BorderSide.none,
          );
        },
      ),
    );
  }
}
