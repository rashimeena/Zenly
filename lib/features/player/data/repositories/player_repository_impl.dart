import 'package:just_audio/just_audio.dart';
import '../../domain/repositories/player_repository.dart';
import '../data_sources/audio_service.dart';
import '../../../ambience/domain/entities/ambience.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final AudioService audioService;

  PlayerRepositoryImpl(this.audioService);

  @override
  Ambience? get currentAmbience => audioService.currentAmbience;

  @override
  Stream<Duration> get positionStream => audioService.positionStream;

  @override
  Stream<Duration> get durationStream => audioService.durationStream;

  @override
  Stream<PlayerState> get playerStateStream => audioService.playerStateStream;

  @override
  bool get isPlaying => audioService.player.playing;

  @override
  Future<void> play(Ambience ambience) => audioService.play(ambience);

  @override
  Future<void> toggle() => audioService.toggle();

  @override
  Future<void> seek(Duration position) => audioService.seek(position);

  @override
  Future<void> stop() => audioService.stop();

  @override
  void dispose() => audioService.dispose();
}
