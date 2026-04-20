import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuAP5wGPo9lk74pJuF2zWQpTm1fwm9ZTPCcBnu_pC5EwE4LKsFdMJAneEnT1I7EUw-5KUO9EDAAOQLsKhOC1y-eKfHIgttzV6NkvzMVYhH5K8a1qApN9DNbLYVViyHioAXft55c6gqYkBROS0t06I2p3pJP4-h_NFqVj0GIprVwTmh64VIeJF58-e__qIq-r6N-PP3X3eu6ozzpXICjWSw9fLSFDrTIuq7E8mI_ND1f5pySoIN9BG270yGEcpSs17T0Ku6-RnQXbHiw",
              width: 48,
              height: 48,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Morning Mist",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "PLAYING NOW",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.play_arrow_rounded,
              color: Theme.of(context).colorScheme.primary,
              size: 32,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.close_rounded,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
