import 'package:ambience_app/features/ambience/presentation/widgets/card.dart';
import 'package:flutter/material.dart';

class AmbienceGrid extends StatelessWidget {
  const AmbienceGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      (
        "Forest Focus",
        "Focus",
        "45:00",
        "https://lh3.googleusercontent.com/aida-public/AB6AXuB48_ewGR1KLOAex0YuFH6KQocwlbfipMEwL87cI0vQ30IJb7pIsYioVjJmCO6geCAnnQE0hMzJs7mVwfXfQBo09YZ-LVVvvxJ5ZBt_P6k0zkm1FBrQeg4UGM-71sQPj46j39fcRPC64mEcmYP-BZF3w3LPt3aAXy0rBmnTgtyIrtfe2NXkq9SJukljeUhPDD7Xo-ycdzMYlvUP5_ZwUUO1awmp0Rx63iRhGNwA_29MMgKuI4FpnbVMoNy4OCPayRNMgIxhAkikmGM",
        "Deep pine whispers and distant bird song."
      ),
      (
        "Tidal Drift",
        "Calm",
        "30:00",
        "https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80",
        "Rhythmic ocean waves on a soft sand shore."
      ),
      (
        "Ember Glow",
        "Sleep",
        "∞",
        "https://images.unsplash.com/photo-1520113412646-04fc68c0bc21?auto=format&fit=crop&w=800&q=80",
        "The gentle crackle of a warm hearth."
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: 24),
      itemBuilder: (_, i) {
        final item = items[i];
        return AmbienceCard(
          title: item.$1,
          tag: item.$2,
          duration: item.$3,
          image: item.$4,
          description: item.$5,
        );
      },
    );
  }
}
