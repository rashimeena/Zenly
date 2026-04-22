import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/detail_top_bar.dart';
import '../widgets/reflectio_header.dart';
import '../widgets/reflection_body.dart';
import '../widgets/stats_card.dart';

class JournalDetailScreen extends StatelessWidget {
  const JournalDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const DetailTopBar(),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: const [
                    ReflectionHeader(),

                    SizedBox(height: 20),

                    ReflectionBody(),

                    SizedBox(height: 20),

                    StatsCards(),

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