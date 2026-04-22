import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_journals.dart';
import '../../domain/usecases/save_journal.dart';
import 'journal_event.dart';
import 'journal_state.dart';

class JournalBloc extends Bloc<JournalEvent, JournalState> {
  final SaveJournal saveJournalUseCase;
  final GetJournals getJournalsUseCase;

  JournalBloc({
    required this.saveJournalUseCase,
    required this.getJournalsUseCase,
  }) : super(JournalInitial()) {
    on<SaveJournalEvent>(_onSaveJournal);
    on<LoadJournalsEvent>(_onLoadJournals);
  }

  Future<void> _onSaveJournal(
    SaveJournalEvent event,
    Emitter<JournalState> emit,
  ) async {
    try {
      emit(JournalLoading());
      await saveJournalUseCase(event.journal);
      emit(JournalSaved());
      // Reload journals after saving
      add(const LoadJournalsEvent());
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }

  Future<void> _onLoadJournals(
    LoadJournalsEvent event,
    Emitter<JournalState> emit,
  ) async {
    try {
      emit(JournalLoading());
      final journals = await getJournalsUseCase();
      emit(JournalLoaded(journals));
    } catch (e) {
      emit(JournalError(e.toString()));
    }
  }
}
