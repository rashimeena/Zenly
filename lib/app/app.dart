import 'package:ambience_app/app/router.dart';
import 'package:ambience_app/shared/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../features/ambience/data/data_sources/ambience_local_datasource.dart';
import '../features/ambience/data/repositories/ambience_repository_impl.dart';
import '../features/ambience/domain/usecases/get_ambiences.dart';
import '../features/ambience/presentation/bloc/ambience_bloc.dart';
import '../features/ambience/presentation/bloc/ambience_event.dart';
import '../features/journal/data/data_sources/journal_local_datasource.dart';
import '../features/journal/data/models/journal_model.dart';
import '../features/journal/data/repositories/journal_repository_impl.dart';
import '../features/journal/domain/usecases/get_journals.dart';
import '../features/journal/domain/usecases/save_journal.dart';
import '../features/journal/presentation/bloc/journal_bloc.dart';
import '../features/journal/presentation/bloc/journal_event.dart';
import '../features/player/data/data_sources/audio_service.dart';
import '../features/player/data/repositories/player_repository_impl.dart';
import '../features/player/domain/usecases/player_usecases.dart';
import '../features/player/presentation/bloc/player_bloc.dart';

class AmbienceApp extends StatelessWidget {
  final Box<JournalModel> journalBox;

  const AmbienceApp({super.key, required this.journalBox});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<JournalRepositoryImpl>(
          create: (context) => JournalRepositoryImpl(
            JournalLocalDataSourceImpl(journalBox),
          ),
        ),
        RepositoryProvider<AmbienceRepositoryImpl>(
          create: (context) => const AmbienceRepositoryImpl(
            AmbienceLocalDataSource(),
          ),
        ),
        RepositoryProvider<PlayerRepositoryImpl>(
          create: (context) => PlayerRepositoryImpl(
            AudioService(),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<JournalBloc>(
            create: (context) => JournalBloc(
              saveJournalUseCase: SaveJournal(
                context.read<JournalRepositoryImpl>(),
              ),
              getJournalsUseCase: GetJournals(
                context.read<JournalRepositoryImpl>(),
              ),
            )..add(const LoadJournalsEvent()),
          ),
          BlocProvider<AmbienceBloc>(
            create: (context) => AmbienceBloc(
              getAmbiencesUseCase: GetAmbiences(
                context.read<AmbienceRepositoryImpl>(),
              ),
            )..add(LoadAmbiencesEvent()),
          ),
          BlocProvider<PlayerBloc>(
            create: (context) => PlayerBloc(
              playAudioUseCase: PlayAudio(
                context.read<PlayerRepositoryImpl>(),
              ),
              toggleAudioUseCase: ToggleAudio(
                context.read<PlayerRepositoryImpl>(),
              ),
              stopAudioUseCase: StopAudio(
                context.read<PlayerRepositoryImpl>(),
              ),
              seekAudioUseCase: SeekAudio(
                context.read<PlayerRepositoryImpl>(),
              ),
              repository: context.read<PlayerRepositoryImpl>(),
            ),
          ),
        ],
        child: MaterialApp(
          title: 'Ambience App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme,
          themeMode: ThemeMode.light,
          initialRoute: AppRouter.home,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
