import 'package:equatable/equatable.dart';
import '../../domain/entities/ambience.dart';

abstract class AmbienceState extends Equatable {
  const AmbienceState();

  @override
  List<Object?> get props => [];
}

class AmbienceInitial extends AmbienceState {}

class AmbienceLoading extends AmbienceState {}

class AmbienceLoaded extends AmbienceState {
  final List<Ambience> ambiences;
  final List<Ambience> filteredAmbiences;
  final String query;
  final String selectedTag;

  const AmbienceLoaded({
    required this.ambiences,
    required this.filteredAmbiences,
    this.query = '',
    this.selectedTag = 'All',
  });

  @override
  List<Object?> get props => [ambiences, filteredAmbiences, query, selectedTag];
}

class AmbienceError extends AmbienceState {
  final String message;

  const AmbienceError(this.message);

  @override
  List<Object?> get props => [message];
}
