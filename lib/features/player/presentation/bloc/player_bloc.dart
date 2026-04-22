import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/player_repository.dart';
import '../../domain/usecases/player_usecases.dart';
import 'player_event.dart';
import 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayAudio playAudioUseCase;
  final ToggleAudio toggleAudioUseCase;
  final StopAudio stopAudioUseCase;
  final SeekAudio seekAudioUseCase;
  final PlayerRepository repository;
  
  late final StreamSubscription _stateSubscription;

  PlayerBloc({
    required this.playAudioUseCase,
    required this.toggleAudioUseCase,
    required this.stopAudioUseCase,
    required this.seekAudioUseCase,
    required this.repository,
  }) : super(PlayerInitial()) {
    on<PlayAmbienceEvent>(_onPlay);
    on<TogglePlayEvent>(_onToggle);
    on<StopPlayerEvent>(_onStop);
    on<SeekEvent>(_onSeek);
    on<_UpdatePlayerStateEvent>(_onUpdateState);

    // Listen to player state changes
    _stateSubscription = repository.playerStateStream.listen((state) {
      if (repository.currentAmbience != null) {
        add(_UpdatePlayerStateEvent(repository.isPlaying));
      }
    });
  }

  Future<void> _onPlay(PlayAmbienceEvent event, Emitter<PlayerState> emit) async {
    emit(PlayerLoading());
    try {
      await playAudioUseCase(event.ambience);
      emit(PlayerPlaying(ambience: event.ambience, isPlaying: true));
    } catch (e) {
      emit(PlayerError(e.toString()));
    }
  }

  Future<void> _onToggle(TogglePlayEvent event, Emitter<PlayerState> emit) async {
    await toggleAudioUseCase();
  }

  void _onUpdateState(_UpdatePlayerStateEvent event, Emitter<PlayerState> emit) {
    if (repository.currentAmbience != null) {
      emit(PlayerPlaying(
        ambience: repository.currentAmbience!,
        isPlaying: event.isPlaying,
      ));
    }
  }

  Future<void> _onStop(StopPlayerEvent event, Emitter<PlayerState> emit) async {
    await stopAudioUseCase();
    emit(PlayerStopped());
  }

  Future<void> _onSeek(SeekEvent event, Emitter<PlayerState> emit) async {
    await seekAudioUseCase(event.position);
  }

  @override
  Future<void> close() {
    _stateSubscription.cancel();
    return super.close();
  }
}

class _UpdatePlayerStateEvent extends PlayerEvent {
  final bool isPlaying;
  const _UpdatePlayerStateEvent(this.isPlaying);
  @override
  List<Object?> get props => [isPlaying];
}
