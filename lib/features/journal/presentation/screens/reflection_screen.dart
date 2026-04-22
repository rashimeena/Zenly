import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/features/journal/domain/entities/journal_entity.dart';
import 'package:ambience_app/features/journal/presentation/bloc/journal_bloc.dart';
import 'package:ambience_app/features/journal/presentation/bloc/journal_event.dart';
import 'package:ambience_app/features/journal/presentation/bloc/journal_state.dart';
import 'package:ambience_app/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';
import '../widgets/journal_input.dart';
import '../widgets/mood_selector.dart';
import '../widgets/save_section.dart';
import '../widgets/info_card.dart';
import '../widgets/top_bar.dart';
import '../widgets/journal_page_header.dart';

class ReflectionScreen extends StatefulWidget {
  const ReflectionScreen({super.key});

  @override
  State<ReflectionScreen> createState() => _ReflectionScreenState();
}

class _ReflectionScreenState extends State<ReflectionScreen> {
  final TextEditingController _contentController = TextEditingController();
  String _selectedMood = "Grounded";

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  void _onSave() {
    if (_contentController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter some reflection")),
      );
      return;
    }

    final journal = JournalEntity(
      id: const Uuid().v4(),
      title: "Reflection", // Simplified as per instructions
      content: _contentController.text.trim(),
      mood: _selectedMood,
      createdAt: DateTime.now(),
    );

    context.read<JournalBloc>().add(SaveJournalEvent(journal));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<JournalBloc, JournalState>(
      listener: (context, state) {
        if (state is JournalSaved) {
          Navigator.pushReplacementNamed(context, AppRouter.history);
        } else if (state is JournalError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              const JournalTopBar(
                showBackButton: true,
                title: "Reflect",
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const JournalPageHeader(
                        title: "What is gently present with you right now?",
                        subtitle:
                            "Take a breath. Let your thoughts flow without judgment.",
                      ),
                      const SizedBox(height: 30),
                      JournalInput(controller: _contentController),
                      const SizedBox(height: 30),
                      MoodSelector(
                        initialMood: _selectedMood,
                        onMoodChanged: (mood) {
                          setState(() => _selectedMood = mood);
                        },
                      ),
                      const SizedBox(height: 30),
                      SaveSection(onSave: _onSave),
                      const SizedBox(height: 30),
                      const InfoCard(),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}