import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'progress_bar.dart';

class PlayerControls extends StatefulWidget {
  const PlayerControls({super.key});

  @override
  State<PlayerControls> createState() => _PlayerControlsState();
}

class _PlayerControlsState extends State<PlayerControls> {
  bool isPlaying = true;

  void togglePlay() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
            ),

            const SizedBox(width: 20),

            GestureDetector(
              onTap: togglePlay,
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
              onPressed: () {},
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
                      Navigator.pop(context);
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
  }
}