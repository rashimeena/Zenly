import 'package:equatable/equatable.dart';

abstract class AmbienceEvent extends Equatable {
  const AmbienceEvent();

  @override
  List<Object?> get props => [];
}

class LoadAmbiencesEvent extends AmbienceEvent {}

class FilterAmbiencesEvent extends AmbienceEvent {
  final String query;
  final String tag;

  const FilterAmbiencesEvent({this.query = '', this.tag = 'All'});

  @override
  List<Object?> get props => [query, tag];
}
