import '../../domain/entities/ambience.dart';
import '../../domain/repositories/ambience_repository.dart';

class GetAmbiences {
  final AmbienceRepository repository;

  GetAmbiences(this.repository);

  Future<List<Ambience>> call() async {
    return await repository.getAmbiences();
  }
}
