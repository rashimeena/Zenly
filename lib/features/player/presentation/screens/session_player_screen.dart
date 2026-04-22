import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_state.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/breathing_visual.dart';
import '../widgets/player_controls.dart';
import 'package:ambience_app/features/journal/presentation/widgets/top_bar.dart';

class SessionPlayerScreen extends StatelessWidget {
  const SessionPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final current = state is PlayerPlaying ? state.ambience : null;

        return Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              children: [
                JournalTopBar(
                  showBackButton: true,
                  title: current?.title ?? "Session",
                ),
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
      },
    );
  }
}