import '../entities/ambience.dart';

abstract class AmbienceRepository {
  Future<List<Ambience>> getAmbiences();
}
