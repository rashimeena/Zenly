import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AmbienceTopBar extends StatelessWidget {
  const AmbienceTopBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.rightWidget,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? rightWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (showBackButton) ...[
          AmbienceCircleIconButton(
            icon: Icons.arrow_back_rounded,
            onTap: onBackPressed ?? () => Navigator.of(context).pop(),
          ),
          const SizedBox(width: 12),
        ],
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        rightWidget,
      ].whereType<Widget>().toList(),
    );
  }
}

class AmbienceGreeting extends StatelessWidget {
  const AmbienceGreeting({
    super.key,
    required this.name,
    required this.subtitle,
  });

  final String name;
  final String subtitle;

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 350;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${_getGreeting()},',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: isSmall ? 24 : 28,
                    height: 1.05,
                    color: AppColors.onSurface,
                  ),
            ),
            Text(
              '$name.',
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontSize: isSmall ? 36 : 42,
                    height: 1.0,
                    color: AppColors.onSurface,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            const SizedBox(height: 12),
            Text(
              subtitle,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontSize: isSmall ? 13 : 15,
                    height: 1.45,
                    color: AppColors.onSurface.withValues(alpha: 0.7),
                  ),
            ),
          ],
        );
      },
    );
  }
}

class AmbienceCircleIconButton extends StatelessWidget {
  const AmbienceCircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerHigh.withValues(alpha: 0.8),
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
