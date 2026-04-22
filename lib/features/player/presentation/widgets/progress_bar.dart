import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_event.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  Widget build(BuildContext context) {
    final repository = context.read<PlayerBloc>().repository;

    return StreamBuilder<Duration>(
      stream: repository.positionStream,
      builder: (context, positionSnapshot) {
        final position = positionSnapshot.data ?? Duration.zero;

        return StreamBuilder<Duration>(
          stream: repository.durationStream,
          builder: (context, durationSnapshot) {
            final duration = durationSnapshot.data ?? Duration.zero;
            final progress = duration.inMilliseconds > 0
                ? position.inMilliseconds / duration.inMilliseconds
                : 0.0;

            return Column(
              children: [
                GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    final box = context.findRenderObject() as RenderBox;
                    final width = box.size.width - 40;
                    final localX = details.localPosition.dx - 20;
                    final newProgress = (localX / width).clamp(0.0, 1.0);
                    final newPosition = Duration(
                      milliseconds: (duration.inMilliseconds * newProgress).toInt(),
                    );
                    context.read<PlayerBloc>().add(SeekEvent(newPosition));
                  },
                  child: Container(
                    height: 12,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(
                        height: 4,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: AppColors.secondary.withValues(alpha: 0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: FractionallySizedBox(
                          widthFactor: progress.clamp(0.0, 1.0),
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_formatDuration(position), style: const TextStyle(fontSize: 12)),
                      Text(_formatDuration(duration), style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}