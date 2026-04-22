import 'package:ambience_app/features/ambience/presentation/widgets/ambience_visuals.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AmbienceHeroCard extends StatelessWidget {
  const AmbienceHeroCard({
    super.key,
    required this.title,
    required this.tag,
    required this.subtitle,
  });

  final String title;
  final String tag;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final palette = ambiencePaletteForTag(tag);

    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: palette,
        ),
        boxShadow: [
          BoxShadow(
            color: palette.first.withOpacity(0.25),
            blurRadius: 30,
            offset: const Offset(0, 14),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: -20,
            top: -16,
            child: _Glow(size: 108, color: Colors.white.withOpacity(0.22)),
          ),
          Positioned(
            right: -24,
            top: 44,
            child: _Glow(size: 80, color: Colors.white.withOpacity(0.16)),
          ),
          Positioned(
            left: 18,
            right: 18,
            top: 18,
            child: Row(
              children: [
                AmbienceTagPill(label: tag),
                const Spacer(),
                AmbienceCircleIconButton(
                  icon: Icons.more_horiz_rounded,
                  onTap: () {},
                  fill: Colors.white.withOpacity(0.16),
                ),
              ],
            ),
          ),
          Positioned(
            left: 18,
            right: 18,
            bottom: 18,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.12),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white.withOpacity(0.18)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          height: 1.02,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(Icons.water_drop_outlined, color: Colors.white, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          subtitle,
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AmbienceRecipeChip extends StatelessWidget {
  const AmbienceRecipeChip({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh.withOpacity(0.72),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Colors.white.withOpacity(0.55)),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              color: AppColors.onSurface,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class AmbienceTagPill extends StatelessWidget {
  const AmbienceTagPill({
    super.key,
    required this.label,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(99),
        border: Border.all(color: Colors.white.withOpacity(0.18)),
      ),
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.2,
            ),
      ),
    );
  }
}

class AmbienceCircleIconButton extends StatelessWidget {
  const AmbienceCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.fill,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color? fill;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: fill ?? AppColors.surfaceContainerHigh.withOpacity(0.82),
      shape: const CircleBorder(),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 38,
          height: 38,
          child: Icon(icon, size: 18, color: AppColors.onSurface),
        ),
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
