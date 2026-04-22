import 'package:equatable/equatable.dart';
import '../../domain/entities/journal_entity.dart';

abstract class JournalEvent extends Equatable {
  const JournalEvent();

  @override
  List<Object?> get props => [];
}

class SaveJournalEvent extends JournalEvent {
  final JournalEntity journal;

  const SaveJournalEvent(this.journal);

  @override
  List<Object?> get props => [journal];
}

class LoadJournalsEvent extends JournalEvent {
  const LoadJournalsEvent();
}
