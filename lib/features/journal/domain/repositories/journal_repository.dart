import '../entities/journal_entity.dart';

abstract class JournalRepository {
  Future<void> saveJournal(JournalEntity journal);
  Future<List<JournalEntity>> getJournals();
}
