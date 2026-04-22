import 'package:ambience_app/features/journal/domain/entities/journal_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReflectionHeader extends StatelessWidget {
  final JournalEntity journal;

  const ReflectionHeader({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMMM dd, h:mm a').format(journal.createdAt);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "AMBIENCE",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black38,
              ),
            ),
            Text(
              journal.mood.toUpperCase(),
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          journal.title,
          style: const TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w300,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          dateStr,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black45,
          ),
        ),
        const SizedBox(height: 24),
        const Divider(height: 1, thickness: 0.5, color: Colors.black12),
      ],
    );
  }
}