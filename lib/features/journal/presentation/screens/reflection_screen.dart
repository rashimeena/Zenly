import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/journal_input.dart';
import '../widgets/mood_selector.dart';
import '../widgets/save_section.dart';
import '../widgets/info_card.dart';
import '../widgets/top_bar.dart';

class ReflectionScreen extends StatelessWidget {
  const ReflectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const ReflectionTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 20),

                    // Prompt
                    Text(
                      "What is gently present with you right now?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w300,
                        color: AppColors.onSurface,
                      ),
                    ),

                    SizedBox(height: 10),

                    Text(
                      "Take a breath. Let your thoughts flow without judgment.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),

                    SizedBox(height: 30),

                    JournalInput(),

                    SizedBox(height: 30),

                    MoodSelector(),

                    SizedBox(height: 30),

                    SaveSection(),

                    SizedBox(height: 30),

                    InfoCard(),

                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}