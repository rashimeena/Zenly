import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AmbienceTopBar extends StatelessWidget {
  const AmbienceTopBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackPressed,
    this.onSearchPressed,
    this.avatarImage,
  });

  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final VoidCallback? onSearchPressed;
  final String? avatarImage;

  @override
  Widget build(BuildContext context) {
    final leadingIcon = showBackButton ? Icons.arrow_back_rounded : Icons.search_rounded;

    return Row(
      children: [
        _CircleIconButton(
          icon: leadingIcon,
          onTap: showBackButton
              ? (onBackPressed ?? () => Navigator.of(context).pop())
              : (onSearchPressed ?? () {}),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: AppColors.onSurface,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        _ProfileAvatar(
          image: avatarImage ??
              'https://lh3.googleusercontent.com/aida-public/AB6AXuDO0WpBdAVBPxJ5SE978s9LmBaFb7fmMuoj0tEj-jK_2Fo6eBLafYjhiL9KNUTVmuDHXijw_tkRAlE_eFNklGVIGIn5ap-vNMPETqR3vGQu0ArM1cb48LC7EYgxeDMRgtkV6Ylks_19HPPN2u31ND65zTpRa6Ea9NrUjYoFFjv54E7Q5mTxYYo1hwATGpJhBpacNxeguBbKRgiaW6QaP3wvlPzWoVPR1n8DkcG7wLDEOSs56S_Dx1UflA5p4WZPPj-yJaks_FfNC8',
        ),
      ],
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Good morning,',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 31,
                height: 1.05,
                color: AppColors.onSurface,
              ),
        ),
        Text(
          '$name.',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 48,
                height: 1.0,
                color: AppColors.onSurface,
                fontWeight: FontWeight.w500,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 15,
                height: 1.45,
              ),
        ),
      ],
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceContainerHigh.withOpacity(0.8),
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

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.7), width: 1.5),
        image: DecorationImage(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
