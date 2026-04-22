import 'package:ambience_app/features/journal/presentation/bloc/journal_bloc.dart';
import 'package:ambience_app/features/journal/presentation/bloc/journal_state.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/top_bar.dart';
import '../widgets/journal_page_header.dart';
import '../widgets/journal_card.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            const JournalTopBar(
              showBackButton: true,
              title: "Reflections",
              titleStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.onSurface,
              ),
            ),
            Expanded(
              child: BlocBuilder<JournalBloc, JournalState>(
                builder: (context, state) {
                  if (state is JournalLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is JournalLoaded) {
                    final journals = state.journals.reversed.toList();

                    if (journals.isEmpty) {
                      return const Center(
                        child: Text("No reflections found yet."),
                      );
                    }

                    return LayoutBuilder(
                      builder: (context, constraints) {
                        final crossAxisCount = constraints.maxWidth > 800 ? 2 : 1;

                        if (crossAxisCount > 1) {
                          return GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 4,
                              childAspectRatio: 1.8,
                            ),
                            itemCount: journals.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return const JournalPageHeader(
                                  title: "Past Journeys",
                                  subtitle: "Revisit the stillness you’ve found.",
                                  titleSize: 32,
                                  titleWeight: FontWeight.bold,
                                  spacing: 6,
                                );
                              }
                              return JournalCard(journal: journals[index - 1]);
                            },
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.all(16),
                          itemCount: journals.length + 1,
                          itemBuilder: (context, index) {
                            if (index == 0) {
                              return const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  JournalPageHeader(
                                    title: "Past Journeys",
                                    subtitle: "Revisit the stillness you’ve found.",
                                    titleSize: 32,
                                    titleWeight: FontWeight.bold,
                                    spacing: 6,
                                  ),
                                  SizedBox(height: 20),
                                ],
                              );
                            }
                            return JournalCard(journal: journals[index - 1]);
                          },
                        );
                      },
                    );
                  } else if (state is JournalError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}