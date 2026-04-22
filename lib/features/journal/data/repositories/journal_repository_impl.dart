import '../../domain/entities/journal_entity.dart';
import '../../domain/repositories/journal_repository.dart';
import '../data_sources/journal_local_datasource.dart';
import '../models/journal_model.dart';

class JournalRepositoryImpl implements JournalRepository {
  final JournalLocalDataSource localDataSource;

  JournalRepositoryImpl(this.localDataSource);

  @override
  Future<void> saveJournal(JournalEntity journal) async {
    final model = JournalModel.fromEntity(journal);
    return await localDataSource.saveJournal(model);
  }

  @override
  Future<List<JournalEntity>> getJournals() async {
    final models = await localDataSource.getJournals();
    return models.map((model) => model.toEntity()).toList();
  }
}
