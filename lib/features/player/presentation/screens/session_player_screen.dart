import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/breathing_visual.dart';
import '../widgets/player_controls.dart';

class SessionPlayerScreen extends StatelessWidget {
  const SessionPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(title: "Forest Focus"),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(child: BreathingVisual()),
                  PlayerControls(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}