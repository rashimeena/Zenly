import '../../../ambience/domain/entities/ambience.dart';
import '../repositories/player_repository.dart';

class PlayAudio {
  final PlayerRepository repository;
  PlayAudio(this.repository);

  Future<void> call(Ambience ambience) async {
    return repository.play(ambience);
  }
}

class ToggleAudio {
  final PlayerRepository repository;
  ToggleAudio(this.repository);

  Future<void> call() async {
    return repository.toggle();
  }
}

class StopAudio {
  final PlayerRepository repository;
  StopAudio(this.repository);

  Future<void> call() async {
    return repository.stop();
  }
}

class SeekAudio {
  final PlayerRepository repository;
  SeekAudio(this.repository);

  Future<void> call(Duration position) async {
    return repository.seek(position);
  }
}
