import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/history_topbar.dart';
import '../widgets/journal_card.dart';
import '../widgets/bento_journal_card.dart';
import '../widgets/floating_button.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      floatingActionButton: const FloatingTriggerButton(),
      body: SafeArea(
        child: Column(
          children: [
            const HistoryTopBar(),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 10),

                  const Text(
                    "Past Journeys",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppColors.onSurface,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Revisit the stillness you’ve found.",
                    style: TextStyle(color: Colors.black54),
                  ),

                  const SizedBox(height: 20),

                  // Normal Cards
                  JournalCard(
                    title: "Forest Focus",
                    date: "Oct 24, 8:30 AM",
                    mood: "Grounded",
                    preview:
                        "The sound of rain hitting the leaves brought clarity...",
                  ),

                  JournalCard(
                    title: "Midnight Stream",
                    date: "Oct 22, 10:15 PM",
                    mood: "Calm",
                    preview:
                        "Preparing for sleep was easier after tonight's session...",
                  ),

                  // Bento Card
                  const BentoJournalCard(),

                  JournalCard(
                    title: "Urban Zen",
                    date: "Oct 18, 12:30 PM",
                    mood: "Focused",
                    preview:
                        "Even in the middle of city noise, I found my center...",
                  ),

                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}