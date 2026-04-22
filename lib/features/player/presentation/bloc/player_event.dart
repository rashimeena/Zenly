import 'package:equatable/equatable.dart';
import '../../../ambience/domain/entities/ambience.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object?> get props => [];
}

class PlayAmbienceEvent extends PlayerEvent {
  final Ambience ambience;
  const PlayAmbienceEvent(this.ambience);

  @override
  List<Object?> get props => [ambience];
}

class TogglePlayEvent extends PlayerEvent {}

class StopPlayerEvent extends PlayerEvent {}

class SeekEvent extends PlayerEvent {
  final Duration position;
  const SeekEvent(this.position);

  @override
  List<Object?> get props => [position];
}
