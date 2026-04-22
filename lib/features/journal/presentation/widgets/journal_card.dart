import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/features/journal/domain/entities/journal_entity.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class JournalCard extends StatelessWidget {
  final JournalEntity journal;

  const JournalCard({
    super.key,
    required this.journal,
  });

  @override
  Widget build(BuildContext context) {
    final dateStr = DateFormat('MMM dd, h:mm a').format(journal.createdAt);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRouter.journalDetail,
          arguments: journal,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFEAEBC6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      dateStr,
                      style: const TextStyle(fontSize: 12),
                    ),
                    Text(
                      journal.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    journal.mood,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              journal.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}