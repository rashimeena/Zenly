import 'package:flutter/material.dart';

class TopBarWidget extends StatelessWidget {
  final bool showBackButton;

  const TopBarWidget({
    super.key,
    this.showBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.primary),
            )
          else
            Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 12),
          Text(
            "The Sanctuary",
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
          ),
          const Spacer(),
          Icon(Icons.bookmark_border, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          const CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(
              "https://lh3.googleusercontent.com/aida-public/AB6AXuDO0WpBdAVBPxJ5SE978s9LmBaFb7fmMuoj0tEj-jK_2Fo6eBLafYjhiL9KNUTVmuDHXijw_tkRAlE_eFNklGVIGIn5ap-vNMPETqR3vGQu0ArM1cb48LC7EYgxeDMRgtkV6Ylks_19HPPN2u31ND65zTpRa6Ea9DnrUjYoFFjv54E7Q5mTxYYo1hwATGpJhBpacNxeguBbKRgiaW6QaP3wvlPzWoVPR1n8DkcG7wLDEOSs56S_Dx1UflA5p4WZPPj-yJaks_FfNC8",
            ),
          ),
        ],
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Good morning,",
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                height: 1.1,
              ),
        ),
        Text(
          "Elias.",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
                height: 1.1,
              ),
        ),
        const SizedBox(height: 16),
        Text(
          "Find your frequency in our curated library of atmospheric sounds.",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
