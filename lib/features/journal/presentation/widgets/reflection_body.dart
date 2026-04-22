import 'package:ambience_app/features/journal/domain/entities/journal_entity.dart';
import 'package:flutter/material.dart';

class ReflectionBody extends StatelessWidget {
  final JournalEntity journal;

  const ReflectionBody({super.key, required this.journal});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F6D1),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: Colors.black.withValues(alpha: 0.05),
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.format_quote_rounded,
                color: Colors.black26,
                size: 32,
              ),
              const SizedBox(height: 12),
              Text(
                journal.content,
                style: const TextStyle(
                  height: 1.7,
                  fontSize: 17,
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}