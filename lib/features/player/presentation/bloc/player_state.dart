import 'package:equatable/equatable.dart';
import '../../../ambience/domain/entities/ambience.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object?> get props => [];
}

class PlayerInitial extends PlayerState {}

class PlayerLoading extends PlayerState {}

class PlayerPlaying extends PlayerState {
  final Ambience ambience;
  final bool isPlaying;

  const PlayerPlaying({required this.ambience, required this.isPlaying});

  @override
  List<Object?> get props => [ambience, isPlaying];
}

class PlayerStopped extends PlayerState {}

class PlayerError extends PlayerState {
  final String message;
  const PlayerError(this.message);

  @override
  List<Object?> get props => [message];
}
