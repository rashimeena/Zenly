import 'package:ambience_app/features/ambience/domain/entities/ambience.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/ambience_visuals.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_event.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmbienceListCard extends StatelessWidget {
  const AmbienceListCard({
    super.key,
    required this.ambience,
    required this.onTap,
  });

  final Ambience ambience;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final isCurrentPlaying = state is PlayerPlaying && 
                                state.ambience.id == ambience.id && 
                                state.isPlaying;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 350;

            return Material(
              color: isCurrentPlaying 
                  ? AppColors.primaryContainer.withValues(alpha: 0.4) 
                  : AppColors.surfaceContainerHigh.withValues(alpha: 0.72),
              borderRadius: BorderRadius.circular(28),
              child: InkWell(
                onTap: onTap,
                borderRadius: BorderRadius.circular(28),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Artwork(
                        tag: ambience.tag,
                        title: ambience.title,
                        thumbnail: ambience.imagePath,
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    ambience.title,
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          fontSize: isCompact ? 16 : 18,
                                          color: AppColors.onSurface,
                                        ),
                                  ),
                                ),
                                if (!isCompact) _TagPill(label: ambience.tag),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              ambience.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    height: 1.35,
                                    fontSize: isCompact ? 12 : 14,
                                  ),
                            ),
                            const SizedBox(height: 14),
                            Row(
                              children: [
                                Icon(
                                  Icons.schedule_rounded,
                                  size: 16,
                                  color: AppColors.primary.withValues(alpha: 0.85),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  ambience.durationClockLabel,
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        color: AppColors.onSurface,
                                        fontWeight: FontWeight.w600,
                                        fontSize: isCompact ? 11 : 13,
                                      ),
                                ),
                                const Spacer(),
                                _PlayButton(
                                  onTap: () {
                                    if (isCurrentPlaying) {
                                      context.read<PlayerBloc>().add(TogglePlayEvent());
                                    } else {
                                      context.read<PlayerBloc>().add(PlayAmbienceEvent(ambience));
                                    }
                                  },
                                  isPlaying: isCurrentPlaying,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _Artwork extends StatelessWidget {
  const _Artwork({
    required this.tag,
    required this.title,
    required this.thumbnail,
  });

  final String tag;
  final String title;
  final String thumbnail;

  @override
  Widget build(BuildContext context) {
    final palette = ambiencePaletteForTag(tag);

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(thumbnail),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: palette[0].withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _TagPill extends StatelessWidget {
  const _TagPill({
    required this.label,
    this.compact = false,
  });

  final String label;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 10 : 12,
        vertical: compact ? 5 : 6,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.12)),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.2,
            ),
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton({required this.onTap, this.isPlaying = false});

  final VoidCallback onTap;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 42,
          height: 42,
          child: Icon(
            isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}


