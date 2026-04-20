import 'package:ambience_app/features/ambience/presentation/widgets/filter_chips.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/grid.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/header.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/miniplayer.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/searchbarr.dart';
import 'package:flutter/material.dart';
import '../../../../shared/theme/app_colors.dart';

class AmbienceHomeScreen extends StatelessWidget {
  const AmbienceHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [
          const _Content(),
          const Positioned(
            bottom: 90,
            left: 16,
            right: 16,
            child: MiniPlayer(),
          ),
          //const Positioned(bottom: 0, left: 0, right: 0, child: BottomNavBar()),
        ],
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 16, 20, 160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            TopBarWidget(),
            SizedBox(height: 32),
            HomeHeader(),
            SizedBox(height: 32),
            SearchBarWidget(),
            SizedBox(height: 24),
            FilterChips(),
            SizedBox(height: 32),
            AmbienceGrid(),
          ],
        ),
      ),
    );
  }
}
