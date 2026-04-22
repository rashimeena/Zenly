import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import '../../../ambience/domain/entities/ambience.dart';

class AudioService {
  final AudioPlayer _player = AudioPlayer();
  Ambience? _currentAmbience;

  AudioPlayer get player => _player;
  Ambience? get currentAmbience => _currentAmbience;

  Stream<Duration> get positionStream => _player.positionStream;
  Stream<Duration> get durationStream => _player.durationStream.map((d) => d ?? Duration.zero);
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;

  Future<void> play(Ambience ambience) async {
    if (_currentAmbience?.id == ambience.id) {
      if (!_player.playing) {
        await _player.play();
      }
      return;
    }

    _currentAmbience = ambience;
    try {
      await _player.setAsset(ambience.audio);
      await _player.setLoopMode(LoopMode.all);
      await _player.play();
    } catch (e) {
      debugPrint("Error loading audio: $e");
      rethrow;
    }
  }

  Future<void> toggle() async {
    if (_player.playing) {
      await _player.pause();
    } else {
      await _player.play();
    }
  }

  Future<void> seek(Duration position) async {
    await _player.seek(position);
  }

  Future<void> stop() async {
    await _player.stop();
  }

  void dispose() {
    _player.dispose();
  }
}
