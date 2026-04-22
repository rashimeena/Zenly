import '../../domain/entities/ambience.dart';
import '../../domain/repositories/ambience_repository.dart';
import '../data_sources/ambience_local_datasource.dart';

class AmbienceRepositoryImpl implements AmbienceRepository {
  const AmbienceRepositoryImpl(this._localDataSource);

  final AmbienceLocalDataSource _localDataSource;

  @override
  Future<List<Ambience>> getAmbiences() {
    return _localDataSource.loadAmbiences();
  }
}
