import 'package:hive/hive.dart';
import '../models/journal_model.dart';

abstract class JournalLocalDataSource {
  Future<void> saveJournal(JournalModel journal);
  Future<List<JournalModel>> getJournals();
}

class JournalLocalDataSourceImpl implements JournalLocalDataSource {
  final Box<JournalModel> journalBox;

  JournalLocalDataSourceImpl(this.journalBox);

  @override
  Future<void> saveJournal(JournalModel journal) async {
    await journalBox.put(journal.id, journal);
  }

  @override
  Future<List<JournalModel>> getJournals() async {
    return journalBox.values.toList();
  }
}
