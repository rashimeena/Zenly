import '../entities/journal_entity.dart';
import '../repositories/journal_repository.dart';

class SaveJournal {
  final JournalRepository repository;

  SaveJournal(this.repository);

  Future<void> call(JournalEntity journal) async {
    return await repository.saveJournal(journal);
  }
}
