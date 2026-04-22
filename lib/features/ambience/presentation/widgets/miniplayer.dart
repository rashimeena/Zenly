import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_event.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmbienceMiniPlayer extends StatelessWidget {
  const AmbienceMiniPlayer({
    super.key,
    this.onClose,
    this.onTap,
  });

  final VoidCallback? onClose;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        if (state is! PlayerPlaying) return const SizedBox.shrink();

        final current = state.ambience;
        final isPlaying = state.isPlaying;

        return Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap ?? () => Navigator.pushNamed(context, AppRouter.player),
            borderRadius: BorderRadius.circular(22),
            child: Container(
              padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F2CC).withValues(alpha: 0.94),
                borderRadius: BorderRadius.circular(22),
                border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    blurRadius: 22,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      image: DecorationImage(
                        image: AssetImage(current.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'PLAYING NOW',
                          style: TextStyle(
                            fontSize: 10,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          current.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.onSurface,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded),
                    onPressed: () => context.read<PlayerBloc>().add(TogglePlayEvent()),
                    color: AppColors.onSurface,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
