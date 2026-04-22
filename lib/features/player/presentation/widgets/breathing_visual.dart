import 'package:ambience_app/features/player/presentation/bloc/player_bloc.dart';
import 'package:ambience_app/features/player/presentation/bloc/player_state.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreathingVisual extends StatefulWidget {
  const BreathingVisual({super.key});

  @override
  State<BreathingVisual> createState() => _BreathingVisualState();
}

class _BreathingVisualState extends State<BreathingVisual>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        final isPlaying = state is PlayerPlaying && state.isPlaying;

        if (isPlaying && !_controller.isAnimating) {
          _controller.repeat(reverse: true);
        } else if (!isPlaying && _controller.isAnimating) {
          _controller.stop();
        }

        return Center(
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  // Outer Glow
                  Container(
                    width: 260 * _animation.value,
                    height: 260 * _animation.value,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryContainer.withValues(alpha: 0.15),
                    ),
                  ),

                  // Main Circle
                  Container(
                    width: 220 * _animation.value,
                    height: 220 * _animation.value,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF98C9A3),
                          Color(0xFF84CCAF),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Center(
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.2),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}