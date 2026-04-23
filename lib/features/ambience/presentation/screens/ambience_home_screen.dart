import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/features/ambience/domain/entities/ambience.dart';
import 'package:ambience_app/features/ambience/presentation/bloc/ambience_bloc.dart';
import 'package:ambience_app/features/ambience/presentation/bloc/ambience_event.dart';
import 'package:ambience_app/features/ambience/presentation/bloc/ambience_state.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/ambience_card.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/filter_chips.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/header.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/miniplayer.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/searchbar.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AmbienceHomeScreen extends StatefulWidget {
  const AmbienceHomeScreen({super.key});

  @override
  State<AmbienceHomeScreen> createState() => _AmbienceHomeScreenState();
}

class _AmbienceHomeScreenState extends State<AmbienceHomeScreen> {
  static const _tags = ['All', 'Focus', 'Calm', 'Sleep', 'Reset'];

  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    final state = context.read<AmbienceBloc>().state;
    if (state is AmbienceLoaded) {
      context.read<AmbienceBloc>().add(FilterAmbiencesEvent(
            query: query,
            tag: state.selectedTag,
          ));
    }
  }

  void _onTagSelected(String tag) {
    final state = context.read<AmbienceBloc>().state;
    if (state is AmbienceLoaded) {
      context.read<AmbienceBloc>().add(FilterAmbiencesEvent(
            query: state.query,
            tag: tag,
          ));
    }
  }

  void _clearFilters() {
    _searchController.clear();
    context.read<AmbienceBloc>().add(const FilterAmbiencesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFFDFDE2),
                      Color(0xFFF8F6C8),
                      Color(0xFFF3F1B8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            BlocBuilder<AmbienceBloc, AmbienceState>(
              builder: (context, state) {
                final isLoading = state is AmbienceLoading;
                final hasError = state is AmbienceError;
                final filteredAmbiences = state is AmbienceLoaded ? state.filteredAmbiences : const <Ambience>[];
                final selectedTag = state is AmbienceLoaded ? state.selectedTag : 'All';

                return ListView(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 160),
                  children: [
                    AmbienceTopBar(
                      title: 'Zenly',
                      rightWidget: AmbienceCircleIconButton(
                        icon: Icons.history_rounded,
                        onTap: () => Navigator.pushNamed(context, AppRouter.history),
                      ),
                    ),
                    const SizedBox(height: 22),
                    const AmbienceGreeting(
                      name: 'Username',
                      subtitle:
                          'Find your frequency in our curated library of atmospheric sounds.',
                    ),
                    const SizedBox(height: 22),
                    AmbienceSearchBar(
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                    ),
                    const SizedBox(height: 20),
                    AmbienceFilterChips(
                      tags: _tags,
                      selectedTag: selectedTag,
                      onSelected: _onTagSelected,
                    ),
                    const SizedBox(height: 18),
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (hasError)
                      _ErrorState(onRetry: () => context.read<AmbienceBloc>().add(LoadAmbiencesEvent()))
                    else if (filteredAmbiences.isEmpty)
                      _EmptyState(onClearFilters: _clearFilters)
                    else
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final crossAxisCount = constraints.maxWidth > 900
                              ? 3
                              : constraints.maxWidth > 600
                                  ? 2
                                  : 1;

                          if (crossAxisCount > 1) {
                            return GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: crossAxisCount,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                childAspectRatio: 1.5,
                              ),
                              itemCount: filteredAmbiences.length,
                              itemBuilder: (context, index) {
                                return AmbienceListCard(
                                  ambience: filteredAmbiences[index],
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRouter.details,
                                      arguments: filteredAmbiences[index],
                                    );
                                  },
                                );
                              },
                            );
                          }

                          return Column(
                            children: filteredAmbiences.map(
                              (ambience) => Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: AmbienceListCard(
                                  ambience: ambience,
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                      AppRouter.details,
                                      arguments: ambience,
                                    );
                                  },
                                ),
                              ),
                            ).toList(),
                          );
                        },
                      ),
                  ],
                );
              },
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 14,
              child: AmbienceMiniPlayer(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRouter.player);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState({required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(
            'Something went gently off track.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          TextButton(onPressed: onRetry, child: const Text('Try again')),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.onClearFilters});

  final VoidCallback onClearFilters;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 36),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerHigh.withValues(alpha: 0.65),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'No ambiences found',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.onSurface,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different search or clear the current filters.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 18),
          SizedBox(
            width: 160,
            child: OutlinedButton(
              onPressed: onClearFilters,
              child: const Text('Clear Filters'),
            ),
          ),
        ],
      ),
    );
  }
}
