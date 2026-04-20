import 'package:flutter/material.dart';
import '../widgets/header.dart';
import '../widgets/miniplayer.dart';

class AmbienceDetailsScreen extends StatelessWidget {
  const AmbienceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 180),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  TopBarWidget(showBackButton: true),
                  SizedBox(height: 24),
                  DetailsHeroImage(),
                  SizedBox(height: 32),
                  DetailsHeader(),
                  SizedBox(height: 24),
                  DetailsDescription(),
                  SizedBox(height: 32),
                  SensoryLayers(),
                  SizedBox(height: 40),
                  StartSessionButton(),
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 32,
            left: 20,
            right: 20,
            child: MiniPlayer(),
          ),
        ],
      ),
    );
  }
}

class DetailsHeroImage extends StatelessWidget {
  const DetailsHeroImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            blurRadius: 32,
            offset: const Offset(0, 12),
          ),
        ],
        image: const DecorationImage(
          image: NetworkImage(
            "https://lh3.googleusercontent.com/aida-public/AB6AXuB48_ewGR1KLOAex0YuFH6KQocwlbfipMEwL87cI0vQ30IJb7pIsYioVjJmCO6geCAnnQE0hMzJs7mVwfXfQBo09YZ-LVVvvxJ5ZBt_P6k0zkm1FBrQeg4UGM-71sQPj46j39fcRPC64mEcmYP-BZF3w3LPt3aAXy0rBmnTgtyIrtfe2NXkq9SJukljeUhPDD7Xo-ycdzMYlvUP5_ZwUUO1awmp0Rx63iRhGNwA_29MMgKuI4FpnbVMoNy4OCPayRNMgIxhAkikmGM",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 24,
            left: 24,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(99),
                border: Border.all(color: Colors.white.withOpacity(0.2)),
              ),
              child: Text(
                "FOCUS",
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsHeader extends StatelessWidget {
  const DetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Forest Focus",
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: 56,
                height: 1.0,
              ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(
              Icons.schedule,
              size: 20,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(
              "45:00",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class DetailsDescription extends StatelessWidget {
  const DetailsDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Lose yourself in the gentle whispers of ancient pines and the distant song of morning birds. A sonic sanctuary designed to anchor your consciousness in the present moment through organic layering.",
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}

class SensoryLayers extends StatelessWidget {
  const SensoryLayers({super.key});

  @override
  Widget build(BuildContext context) {
    final layers = [
      (Icons.air, "Breeze"),
      (Icons.mist, "Mist"),
      (Icons.wb_sunny_outlined, "Warm Light"),
      (Icons.umbrella_outlined, "Soft Rain"),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SENSORY LAYERS",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: layers.map((layer) => _LayerChip(icon: layer.$1, label: layer.$2)).toList(),
        ),
      ],
    );
  }
}

class _LayerChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _LayerChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.5),
        borderRadius: BorderRadius.circular(99),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: Theme.of(context).colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}

class StartSessionButton extends StatelessWidget {
  const StartSessionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.primaryContainer,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: const Center(
            child: Text(
              "Start Session",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
