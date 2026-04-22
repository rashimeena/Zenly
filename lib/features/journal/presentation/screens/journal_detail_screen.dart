import 'package:ambience_app/features/journal/domain/entities/journal_entity.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/reflectio_header.dart';
import '../widgets/reflection_body.dart';
//import '../widgets/stats_card.dart';

class JournalDetailScreen extends StatelessWidget {
  const JournalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final journal = ModalRoute.of(context)!.settings.arguments as JournalEntity;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const JournalTopBar(
              showBackButton: true,
              title: "Reflection",
              centerTitle: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    ReflectionHeader(journal: journal),
                    const SizedBox(height: 20),
                    ReflectionBody(journal: journal),
                    const SizedBox(height: 20),
                    //const StatsCards(),
                    //const SizedBox(height: 100),
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