import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/features/ambience/domain/entities/ambience.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/details_widgets.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/miniplayer.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/header.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_event.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmbienceDetailsScreen extends StatelessWidget {
  const AmbienceDetailsScreen({super.key, this.ambience});

  final Ambience? ambience;

  static const Ambience _fallback = Ambience(
    id: 1,
    title: 'Forest Focus',
    tag: 'Focus',
    duration: 180,
    thumbnail: 'assets/images/forest_focus.jpg',
    audio: 'assets/audio/forest_focus.mp3',
    description:
        'Lose yourself in the gentle whispers of ancient pines and the distant song of morning birds. A sonic sanctuary designed to anchor your consciousness in the present moment through organic layering.',
    sensory: const ['Breeze', 'Warm Light', 'Mist', 'Binaural', 'Soft Rain'],
  );

  Ambience get _current => ambience ?? _fallback;

  @override
  Widget build(BuildContext context) {
    final current = _current;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFDFDE6),
                      Color(0xFFF7F5CE),
                      Color(0xFFF2F0B8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            ListView(
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 152),
              children: [
                const AmbienceTopBar(
                  title: 'Ambience Details',
                  showBackButton: true,
                ),
                const SizedBox(height: 18),
                AmbienceHeroCard(
                  title: current.title,
                  tag: current.tag,
                  subtitle: 'Soft air, warm light, gentle motion',
                  imagePath: current.imagePath,
                ),
                const SizedBox(height: 18),
                Text(
                  current.title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        fontSize: 34,
                        height: 1.02,
                        color: AppColors.onSurface,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.schedule_rounded,
                      size: 18,
                      color: AppColors.primary.withValues(alpha: 0.88),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      current.durationClockLabel,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: AppColors.onSurface.withValues(alpha: 0.74),
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                Text(
                  current.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        height: 1.55,
                        fontSize: 15,
                      ),
                ),
                const SizedBox(height: 26),
                Text(
                  'Sensory recipe',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: AppColors.onSurface.withValues(alpha: 0.7),
                        letterSpacing: 1.8,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: current.sensory
                      .map((chip) => AmbienceRecipeChip(label: chip))
                      .toList(growable: false),
                ),
                const SizedBox(height: 28),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 56,
                    minWidth: double.infinity,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<PlayerBloc>().add(PlayAmbienceEvent(current));
                      Navigator.of(context).pushNamed(AppRouter.player);
                    },
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('Start Session'),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 14,
              child: AmbienceMiniPlayer(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.player);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
