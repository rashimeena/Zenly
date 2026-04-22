import 'package:ambience_app/features/ambience/data/data_sources/ambience_local_datasource.dart';
import 'package:ambience_app/features/ambience/data/repositories/ambience_repository_impl.dart';
import 'package:ambience_app/features/ambience/domain/entities/ambience.dart';
import 'package:ambience_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/ambience_card.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/filter_chips.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/header.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/miniplayer.dart';
import 'package:ambience_app/features/ambience/presentation/widgets/searchbar.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AmbienceHomeScreen extends StatefulWidget {
  const AmbienceHomeScreen({super.key});

  @override
  State<AmbienceHomeScreen> createState() => _AmbienceHomeScreenState();
}

class _AmbienceHomeScreenState extends State<AmbienceHomeScreen> {
  static const _tags = ['All', 'Focus', 'Calm', 'Sleep', 'Reset'];

  final _repository = const AmbienceRepositoryImpl(AmbienceLocalDataSource());
  final _searchController = TextEditingController();

  String _query = '';
  String _selectedTag = 'All';
  late final Future<List<Ambience>> _ambiencesFuture = _repository.getAmbiences();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<Ambience> _applyFilters(List<Ambience> ambiences) {
    return ambiences.where((ambience) {
      final matchesSearch = _query.isEmpty ||
          ambience.title.toLowerCase().contains(_query) ||
          ambience.description.toLowerCase().contains(_query) ||
          ambience.tag.toLowerCase().contains(_query);
      final matchesTag = _selectedTag == 'All' || ambience.tag == _selectedTag;
      return matchesSearch && matchesTag;
    }).toList(growable: false);
  }

  void _clearFilters() {
    setState(() {
      _query = '';
      _selectedTag = 'All';
      _searchController.clear();
    });
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
            FutureBuilder<List<Ambience>>(
              future: _ambiencesFuture,
              builder: (context, snapshot) {
                final isLoading = snapshot.connectionState == ConnectionState.waiting;
                final hasError = snapshot.hasError;
                final ambiences = snapshot.data ?? const <Ambience>[];
                final filteredAmbiences = _applyFilters(ambiences);

                return ListView(
                  padding: const EdgeInsets.fromLTRB(20, 14, 20, 160),
                  children: [
                    const AmbienceTopBar(title: 'The Sanctuary'),
                    const SizedBox(height: 22),
                    const AmbienceGreeting(
                      name: 'Elias',
                      subtitle:
                          'Find your frequency in our curated library of atmospheric sounds.',
                    ),
                    const SizedBox(height: 22),
                    AmbienceSearchBar(
                      controller: _searchController,
                      onChanged: (value) => setState(() => _query = value.trim().toLowerCase()),
                    ),
                    const SizedBox(height: 14),
                    AmbienceFilterChips(
                      tags: _tags,
                      selectedTag: _selectedTag,
                      onSelected: (tag) => setState(() => _selectedTag = tag),
                    ),
                    const SizedBox(height: 18),
                    if (isLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (hasError)
                      _ErrorState(onRetry: () => setState(() {}))
                    else if (filteredAmbiences.isEmpty)
                      _EmptyState(onClearFilters: _clearFilters)
                    else
                      ...filteredAmbiences.map(
                        (ambience) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: AmbienceListCard(
                            ambience: ambience,
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => AmbienceDetailsScreen(ambience: ambience),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            const Positioned(
              left: 16,
              right: 16,
              bottom: 14,
              child: AmbienceMiniPlayer(
                title: 'Morning Mist',
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
        color: AppColors.surfaceContainerHigh.withOpacity(0.65),
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
