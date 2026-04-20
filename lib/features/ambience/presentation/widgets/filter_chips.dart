import 'package:flutter/material.dart';

class FilterChips extends StatelessWidget {
  const FilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    final filters = ["All", "Focus", "Calm", "Sleep", "Reset"];

    return Column(
      children: [
        SizedBox(
          height: 48,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (_, index) {
              final isSelected = index == 0;

              return ChoiceChip(
                label: Text(filters[index]),
                selected: isSelected,
                onSelected: (_) {},
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Custom Scroll Indicator
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              const Icon(Icons.arrow_left, size: 12, color: Colors.grey),
              Expanded(
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: 0.3,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                ),
              ),
              const Icon(Icons.arrow_right, size: 12, color: Colors.grey),
            ],
          ),
        ),
      ],
    );
  }
}
