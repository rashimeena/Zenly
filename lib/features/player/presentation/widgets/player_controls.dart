import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_event.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_state.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'progress_bar.dart';

class PlayerControls extends StatelessWidget {
  const PlayerControls({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final isPlaying = state is PlayerPlaying && state.isPlaying;
        final repository = context.read<PlayerBloc>().repository;

        return Column(
          children: [
            const ProgressBar(),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.replay_10),
                  color: AppColors.primary,
                  iconSize: 30,
                  onPressed: () async {
                    final bloc = context.read<PlayerBloc>();
                    final position = await repository.positionStream.first;
                    final newPosition = position - const Duration(seconds: 10);
                    bloc.add(SeekEvent(
                        newPosition < Duration.zero ? Duration.zero : newPosition));
                  },
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => context.read<PlayerBloc>().add(TogglePlayEvent()),
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryContainer,
                    ),
                    child: Icon(
                      isPlaying ? Icons.pause : Icons.play_arrow,
                      size: 40,
                      color: AppColors.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                IconButton(
                  icon: const Icon(Icons.forward_10),
                  color: AppColors.primary,
                  iconSize: 30,
                  onPressed: () async {
                    final bloc = context.read<PlayerBloc>();
                    final duration = await repository.durationStream.first;
                    final position = await repository.positionStream.first;
                    final newPosition = position + const Duration(seconds: 10);
                    bloc.add(SeekEvent(
                        newPosition > duration ? duration : newPosition));
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            OutlinedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text("End Session?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          context.read<PlayerBloc>().add(StopPlayerEvent());
                          Navigator.pushNamed(context, AppRouter.reflection);
                        },
                        child: const Text("End"),
                      ),
                    ],
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Text("END SESSION"),
              ),
            ),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }
}