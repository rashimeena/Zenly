import 'package:flutter/material.dart';
import 'package:ambience_app/features/ambience/domain/entities/ambience.dart';
import 'package:ambience_app/features/ambience/presentation/screens/ambience_home_screen.dart';
import 'package:ambience_app/features/ambience/presentation/screens/ambience_details_screen.dart';
import 'package:ambience_app/features/player/presentation/screens/session_player_screen.dart';
import 'package:ambience_app/features/journal/presentation/screens/reflection_screen.dart';
import 'package:ambience_app/features/journal/presentation/screens/journal_history_screen.dart';
import 'package:ambience_app/features/journal/presentation/screens/journal_detail_screen.dart';

class AppRouter {
  static const String home = '/';
  static const String details = '/details';
  static const String player = '/player';
  static const String reflection = '/reflection';
  static const String history = '/history';
  static const String journalDetail = '/journal-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const AmbienceHomeScreen(),
        );

      case details:
        final ambience = settings.arguments as Ambience?;
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => AmbienceDetailsScreen(ambience: ambience),
        );

      case player:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SessionPlayerScreen(),
        );

      case reflection:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const ReflectionScreen(),
        );

      case history:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const HistoryScreen(),
        );

      case journalDetail:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const JournalDetailScreen(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
