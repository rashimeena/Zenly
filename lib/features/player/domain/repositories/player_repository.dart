import 'package:just_audio/just_audio.dart' as ja;
import '../../../ambience/domain/entities/ambience.dart';

abstract class PlayerRepository {
  Ambience? get currentAmbience;
  Stream<Duration> get positionStream;
  Stream<Duration> get durationStream;
  Stream<ja.PlayerState> get playerStateStream;
  bool get isPlaying;

  Future<void> play(Ambience ambience);
  Future<void> toggle();
  Future<void> seek(Duration position);
  Future<void> stop();
  void dispose();
}
