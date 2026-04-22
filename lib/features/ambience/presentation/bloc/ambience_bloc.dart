import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_ambiences.dart';
import 'ambience_event.dart';
import 'ambience_state.dart';

class AmbienceBloc extends Bloc<AmbienceEvent, AmbienceState> {
  final GetAmbiences getAmbiencesUseCase;

  AmbienceBloc({required this.getAmbiencesUseCase}) : super(AmbienceInitial()) {
    on<LoadAmbiencesEvent>(_onLoadAmbiences);
    on<FilterAmbiencesEvent>(_onFilterAmbiences);
  }

  Future<void> _onLoadAmbiences(
    LoadAmbiencesEvent event,
    Emitter<AmbienceState> emit,
  ) async {
    emit(AmbienceLoading());
    try {
      final ambiences = await getAmbiencesUseCase();
      emit(AmbienceLoaded(
        ambiences: ambiences,
        filteredAmbiences: ambiences,
      ));
    } catch (e) {
      emit(AmbienceError(e.toString()));
    }
  }

  void _onFilterAmbiences(
    FilterAmbiencesEvent event,
    Emitter<AmbienceState> emit,
  ) {
    if (state is AmbienceLoaded) {
      final currentState = state as AmbienceLoaded;
      final filtered = currentState.ambiences.where((ambience) {
        final matchesSearch = event.query.isEmpty ||
            ambience.title.toLowerCase().contains(event.query.toLowerCase()) ||
            ambience.description.toLowerCase().contains(event.query.toLowerCase()) ||
            ambience.tag.toLowerCase().contains(event.query.toLowerCase());
        final matchesTag = event.tag == 'All' || ambience.tag == event.tag;
        return matchesSearch && matchesTag;
      }).toList();

      emit(AmbienceLoaded(
        ambiences: currentState.ambiences,
        filteredAmbiences: filtered,
        query: event.query,
        selectedTag: event.tag,
      ));
    }
  }
}
